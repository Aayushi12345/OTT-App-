import 'package:ott_app/data/models/movie_model.dart';
import 'package:equatable/equatable.dart';

abstract class MovieState extends Equatable {}

class LoadingState extends MovieState {

  @override
  List<Object?> get props => [];

}

class LoadedState extends MovieState {
  final List<Results>? carouselList;
  final List<Results>? gridList;
  final int currentPage;
  final int totalPages;
  final bool isReachedEnd;
  final int? carouselCurrentPage;

  LoadedState(this.carouselList, this.gridList, this.currentPage,
      this.totalPages, this.isReachedEnd, this.carouselCurrentPage);

  LoadedState copyWith({
     List<Results>? carouselList,
    List<Results>? gridList,
    int? currentPage,
    int? totalPages,
    bool? isReachedEnd,
    int? carouselCurrentPage,
  }) {
    return LoadedState(
        carouselList ?? this.carouselList,
        gridList ?? this.gridList,
        currentPage ?? this.currentPage,
        totalPages ?? this.totalPages,
        isReachedEnd ?? this.isReachedEnd,
        carouselCurrentPage ?? this.carouselCurrentPage);
  }

  @override
  List<Object?> get props => [
        carouselList,
        gridList,
        currentPage,
        totalPages,
        isReachedEnd,
        carouselCurrentPage
      ];
}

class ErrorState extends MovieState {
  final String error;

  ErrorState(this.error);

  @override
  List<Object?> get props => [];
}
