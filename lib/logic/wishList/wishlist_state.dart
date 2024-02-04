import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:ott_app/data/models/movie_model.dart';


abstract class WishlistState extends Equatable {}
class WishlistLoading extends WishlistState {
  @override
  List<Object?> get props => [];
}

class WishlistInitial extends WishlistState {
  @override
  List<Object?> get props =>  [];
}

class WishlistLoaded extends WishlistState {
  final List<Results>? wishList;

   WishlistLoaded({  this.wishList});

  @override
  List<Object?> get props => [wishList];

  WishlistLoaded copyWith({
    List<Results>? wishList,
  }) {
    return WishlistLoaded(
      wishList: wishList ?? this.wishList,
    );
  }
}



class WishlistError extends WishlistState {
  final String errorMessage;
  WishlistError(this.errorMessage);

  @override
  List<Object?> get props =>  [];
}

class HomeScrollControllerInitialized extends WishlistState {
  final ScrollController scrollController;
  HomeScrollControllerInitialized(this.scrollController);

  @override
  List<Object?> get props =>  [];
}

