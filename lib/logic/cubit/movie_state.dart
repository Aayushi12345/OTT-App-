import 'package:ott_app/data/models/movie_model.dart';
import 'package:equatable/equatable.dart';

abstract class MovieState  extends Equatable {}

class LoadingState extends MovieState {
  @override
  List<Object?> get props => [];}

class LoadedState extends MovieState  {
  final MovieModel posts;
  final List<Results>? gridList;
  final int currentPage;
  final int totalPages;
  final bool isReachedEnd;

  LoadedState(this.posts, this.gridList, this.currentPage, this.totalPages,
      this.isReachedEnd);

  LoadedState copyWith(
      {
        List<Results>? gridList,
        int? currentPage,
        int? totalPages,
        bool? isReachedEnd,
        int? carouselCurrentPage}) {
    return LoadedState(
      posts,
      gridList ?? this.gridList,
      currentPage ?? this.currentPage,
      totalPages ?? this.totalPages,
      isReachedEnd ?? this.isReachedEnd,
    );
  }
    @override
    List<Object?> get props => [posts,gridList,currentPage,totalPages,isReachedEnd];

}

class ErrorState extends MovieState {
  final String error;

  ErrorState(this.error);

  @override
  List<Object?> get props => [];
}
