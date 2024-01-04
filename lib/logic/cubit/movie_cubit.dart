import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ott_app/data/models/movie_model.dart';
import 'package:ott_app/data/repositories%20/repository.dart';
import 'package:ott_app/logic/cubit/movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(LoadingState()) {
    fetchMovieData();
  }

  Repository repository = Repository();

  void fetchMovieData() async {
    try {
      MovieModel posts = await repository.fetchMoviesData();
      emit(LoadedState(posts));
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.values) {
        emit(ErrorState(
            "Can't fetch posts, please check your internet connection!"));
      } else {
        emit(ErrorState(ex.type.toString()));
      }
    }
  }
}
