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
  final int? currentPage;
  final int? totalPages;
  final bool? isReachedEnd;
  final int? carouselCurrentPage;

  LoadedState({
    this.carouselList,
    this.gridList,
    this.currentPage,
    this.totalPages,
    this.isReachedEnd,
    this.carouselCurrentPage,
  });

  LoadedState copyWith({
   final List<Results>? carouselList,
    final List<Results>? gridList,
    final   int? currentPage,
    final  int? totalPages,
    final bool? isReachedEnd,
    final  int? carouselCurrentPage,
  }) {
    return LoadedState(
        carouselList: carouselList ?? this.carouselList,
        gridList: gridList ?? this.gridList,
        currentPage: currentPage ?? this.currentPage,
        totalPages: totalPages ?? this.totalPages,
        isReachedEnd: isReachedEnd ?? this.isReachedEnd,
        carouselCurrentPage: carouselCurrentPage ?? this.carouselCurrentPage);
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
