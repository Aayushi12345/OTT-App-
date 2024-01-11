import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ott_app/data/network/dio_custom_exception.dart';
import 'package:ott_app/data/repositories%20/repository.dart';
import 'package:ott_app/logic/cubit/movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final Repository _repository;

  MovieCubit(this._repository) : super(LoadingState());

  void loadSecondPageOfMovie() {
    loadMoviesData(1);
  }
  Future<void> loadMoviesData(int pageNo) async {
    try {
      if (pageNo == 1) {
        final dataList = await _repository.getMoviesData(pageNo);
        final dataList2 = await _repository.getMoviesData(++pageNo);

        emit(LoadedState(dataList, dataList2.results,
            dataList.page ?? 1, dataList.totalPages ?? -1, false));
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

}
