import 'package:ott_app/data/models/movie_model.dart';

abstract class MovieState {}

class LoadingState extends MovieState {}

class LoadedState extends MovieState {
  final MovieModel posts;

  LoadedState(this.posts);
}

class ErrorState extends MovieState {
  final String error;

  ErrorState(this.error);
}
