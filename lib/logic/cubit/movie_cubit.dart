import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ott_app/data/models/movie_model.dart';
import 'package:ott_app/data/network/dio_custom_exception.dart';
import 'package:ott_app/data/repositories%20/repository.dart';
import 'package:ott_app/di/service_locator.dart';
import 'package:ott_app/logic/cubit/movie_state.dart';
import 'package:ott_app/preference/shared_preferences.dart';
import 'package:ott_app/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovieCubit extends Cubit<MovieState> {
  final Repository _repository;
  Timer? _timer;

  MovieCubit(this._repository) : super(LoadingState());
  final PageController pageController = PageController();
  SharedPreferencesService manager = TTNSL.get<SharedPreferencesService>();
  MovieModel currentUser = MovieModel();

  List<Results> favouriteList = [];

  // void loadSecondPageOfMovie() {
  //   fetchMoviesData(1);
  // }

  getFavouriteList() async {
    favouriteList = manager.getList<Results>('favouriteList', Results.fromJson);
    print('FavList: $favouriteList');
  }

  getUser() async {
    currentUser = manager.getObject('currentUser', MovieModel.fromJson)!;
    print('currentUser : $currentUser');
  }

  Future<void> fetchMoviesData(int pageNo) async {
    getFavouriteList();
    var carouselList = await _repository.getMoviesData(pageNo);
    var gridList = await _repository.getMoviesData(++pageNo);

    checkFavourites(favouriteList, carouselList.results, gridList.results,
        gridList.page, gridList.totalPages, false, false);
    getUser();
  }

  Future<void> fetchGridListPagination(int pageNo) async {
    var homeLoadedState = state as LoadedState;
    emit(homeLoadedState.copyWith(isReachedEnd: true));

    var gridList = await _repository.getMoviesData(pageNo);
    homeLoadedState.gridList?.addAll(gridList.results ?? []);
    checkFavourites(favouriteList, null, homeLoadedState.gridList,
        gridList.page, gridList.totalPages, false, true);
  }

  // Future<void> loadMoviesData(int pageNo) async {
  //   getFavouriteList();
  //   try {
  //     if (pageNo == 1) {
  //       final dataList = await _repository.getMoviesData(pageNo);
  //       final dataList2 = await _repository.getMoviesData(++pageNo);
  //
  //       checkFavourites(
  //           favouriteList,
  //           dataList.results,
  //           dataList2.results,
  //           dataList.page ?? 1,
  //           dataList.totalPages ?? -1,
  //           false,true);
  //       setupCarousalAutomaticRotation();
  //     } else {
  //       if (state is LoadedState) {
  //         var homeLoadedState = state as LoadedState;
  //         emit(homeLoadedState.copyWith(isReachedEnd: true));
  //
  //         final dataList = await _repository.getMoviesData(pageNo);
  //
  //         homeLoadedState.gridList?.addAll(dataList.results ?? []);
  //         checkFavourites(
  //             favouriteList,
  //             dataList.results,
  //             dataList.results,
  //             dataList.page ?? 1,
  //             dataList.totalPages ?? -1,
  //             false,true);
  //         // emit((state as LoadedState).copyWith(
  //         //     gridList: homeLoadedState.gridList,
  //         //     currentPage: dataList.page,
  //         //     totalPages: dataList.totalPages,
  //         //     isReachedEnd: false));
  //       }
  //     }
  //   } on CustomException catch (e) {
  //     emit(ErrorState('Failed to load data: ${e.message}'));
  //   }
  // }
  void _setupCarousalAutomaticRotation() {
    if (state is LoadedState) {
      const Duration duration = Constant.carouselTimeout;

      _timer = Timer.periodic(duration, (Timer timer) {
        var currentState = state as LoadedState;
        var nextPage = (currentState.carouselCurrentPage! + 1) %
            currentState.carouselList!.length;

        emit(currentState.copyWith(carouselCurrentPage: nextPage));
        pageController.animateToPage(
          nextPage,
          duration: Constant.carouselAnimateTimeout,
          curve: Curves.slowMiddle,
        );
      });
    }
  }

  void loadMore() {
    if (state is LoadedState) {
      var currentState = state as LoadedState;

      if (!currentState.isReachedEnd! &&
          currentState.totalPages! >= currentState.currentPage!) {
        int currentPage = currentState.currentPage!;
        fetchMoviesData(++currentPage);
      }
    }
  }

    void checkFavourites(List<Results> favouriteList,
        List<Results>? carouselList,
        List<Results>? gridList,
        int? page,
        int? totalPages,
        bool? isFav,
        bool isPagination) {
      if (favouriteList != null && favouriteList.isNotEmpty) {
        if (carouselList != null) {
          for (Results carouselItem in carouselList) {
            if (favouriteList.any((favItem) => favItem.id == carouselItem.id)) {
              carouselItem.isFavourite = true;
            }
          }
        }

        if (gridList != null) {
          for (Results gridItem in gridList) {
            if (favouriteList.any((favItem) => favItem.id == gridItem.id)) {
              gridItem.isFavourite = true;
            }
          }
        }
      }


      if (!isPagination) {
        emit(LoadedState(
          carouselList: carouselList,
          gridList: gridList,
          currentPage: page,
          carouselCurrentPage: 0,
          isReachedEnd: false,
          totalPages: totalPages,
        ));
      } else {
        var homeLoadedState = state as LoadedState;
        emit(homeLoadedState.copyWith(
          gridList: homeLoadedState.gridList,
          currentPage: page,
          totalPages: totalPages,
          isReachedEnd: false,
        ));
      }
      if (isFav != null && isFav == false) {
        _setupCarousalAutomaticRotation();
      }
    }
    saveFavourite(Results results) async {
      var homeLoadedState = state as LoadedState;
      var isFav = true;
      if (results.isFavourite != null && results.isFavourite == true) {
        for (Results favResults in favouriteList) {
          if (favResults.id == results.id) {
            results.isFavourite = null;
            favouriteList.remove(favResults);
          }
        }
      } else {
        results.isFavourite = true;
        favouriteList.add(results);
      }
      await manager.removeList('favouriteList');
      await manager.saveList(
          'favouriteList', favouriteList.map((fav) => fav.toJson()).toList());
      getFavouriteList();
      checkFavourites(
          favouriteList,
          homeLoadedState.carouselList,
          homeLoadedState.gridList,
          homeLoadedState.currentPage,
          homeLoadedState.totalPages,
          isFav,
          false);
    }

    void updateDotIndicator(int pageNo) {
      if (state is LoadedState) {
        var currentState = state as LoadedState;
        emit(currentState.copyWith(carouselCurrentPage: pageNo));
      }
    }
  }
