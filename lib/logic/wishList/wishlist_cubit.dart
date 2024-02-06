import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:ott_app/data/models/movie_model.dart';
import 'package:ott_app/di/service_locator.dart';
import 'package:ott_app/logic/cubit/movie_state.dart';
import 'package:ott_app/logic/wishList/wishlist_state.dart';
import 'package:bloc/bloc.dart';
import 'package:ott_app/preference/shared_preferences.dart';

class WishListCubit extends Cubit<WishlistState> {
  WishListCubit() : super(WishlistInitial());
  SharedPreferencesService manager = TTNSL.get<SharedPreferencesService>();
  // List<Results> favouriteList = [];
  //
  // getFavouriteList() async {
  //   favouriteList = manager.getList<Results>('favouriteList', Results.fromJson);
  // }

  Future<void> fetchFavouritesData() async {
    List<Results> favouriteList = manager.getList<Results>('favouriteList', Results.fromJson);
    emit(WishlistLoaded(
      wishList: favouriteList,
    ));
  }
  saveFavourite(Results results) async {
    var favLoadedState = state as WishlistLoaded;
    List<Results> favouriteList = [];
    if (results.isFavourite!) {

      favouriteList = favLoadedState.wishList
          ?.where((favResults) {
        if (favResults.id == results.id) {
          results.isFavourite = false;
          return false;
        }
        return true; // Include this element in the new list
      })
          .toList() ?? [];

      await manager.removeList('favouriteList');
      await manager.saveList(
        'favouriteList',
        favouriteList.map((fav) => fav.toJson()).toList(),
      );
      fetchFavouritesData();

    }
  }
}
