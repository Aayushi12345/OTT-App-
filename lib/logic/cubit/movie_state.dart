import 'package:ott_app/data/models/movie_model.dart';
import 'package:equatable/equatable.dart';

abstract class MovieState {}

class LoadingState extends MovieState {}

class LoadedState extends MovieState with EquatableMixin {
  final MovieModel posts;

  LoadedState(this.posts);

  @override
  List<Object?> get props =>[posts];
}

class ErrorState extends MovieState {
  final String error;

  ErrorState(this.error);
}
