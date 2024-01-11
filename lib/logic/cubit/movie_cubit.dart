import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ott_app/data/network/dio_custom_exception.dart';
import 'package:ott_app/data/repositories%20/repository.dart';
import 'package:ott_app/logic/cubit/movie_state.dart';
import 'package:ott_app/utils/constant.dart';

class MovieCubit extends Cubit<MovieState> {
  final Repository _repository;
  Timer? _timer;
  MovieCubit(this._repository) : super(LoadingState());
  final PageController pageController = PageController();

  void loadSecondPageOfMovie() {
    loadMoviesData(1);
  }
  Future<void> loadMoviesData(int pageNo) async {
    try {
      if (pageNo == 1) {
        final dataList = await _repository.getMoviesData(pageNo);
        final dataList2 = await _repository.getMoviesData(++pageNo);

        emit(LoadedState(dataList.results, dataList2.results,
            dataList.page ?? 1, dataList.totalPages ?? -1, false,0));
        setupCarousalAutomaticRotation();
      } else
      {
        if (state is LoadedState) {
          var homeLoadedState = state as LoadedState;
          emit(homeLoadedState.copyWith(isReachedEnd: true));

          final dataList = await _repository.getMoviesData(pageNo);

          homeLoadedState.gridList?.addAll(dataList.results ?? []);
          emit((state as LoadedState).copyWith(
              gridList: homeLoadedState.gridList,
              currentPage: dataList.page,
              totalPages: dataList.totalPages,
              isReachedEnd: false));
        }
      }
    } on CustomException catch (e) {
      emit(ErrorState('Failed to load data: ${e.message}'));
    }
  }
  void loadMore() {
    if (state is LoadedState) {
      var currentState = state as LoadedState;

      if (!currentState.isReachedEnd &&
      currentState.totalPages>= currentState.currentPage) {
        int currentPage = currentState.currentPage;
        loadMoviesData(++currentPage);
      }
    }
  }
  void setupCarousalAutomaticRotation() {
    if (state is LoadedState) {
      const Duration duration =
      Duration(seconds: Constant.CAROUSEL_INTERVAL_SEC);

      _timer = Timer.periodic(duration, (Timer timer) {
        var currentState = state as LoadedState;

        if (currentState.carouselCurrentPage! <
            currentState.carouselList!.length - 1) {
          var nextPage = currentState.carouselCurrentPage! + 1;
          emit(currentState.copyWith(carouselCurrentPage: nextPage));
          pageController.nextPage(
              duration: const Duration(
                  milliseconds: Constant.CAROUSEL_ANIMATION_MILLI),
              curve: Curves.easeInOut);
        } else {
          pageController.jumpTo(0);
          emit(currentState.copyWith(carouselCurrentPage: 0));
        }
      });
    }
  }

  void updateDotIndicator(int pageNo) {
    if (state is LoadedState) {
      var currentState = state as LoadedState;
      emit(currentState.copyWith(carouselCurrentPage: pageNo));
    }
  }

}
