import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:ott_app/data/models/movie_model.dart';
import 'package:ott_app/di/service_locator.dart';
import 'package:ott_app/logic/wishList/wishlist_state.dart';
import 'package:bloc/bloc.dart';
import 'package:ott_app/preference/shared_preferences.dart';

class WishListCubit extends Cubit<WishlistState> {

  WishListCubit() : super( WishlistInitial());
SharedPreferencesService manager = TTNSL.get<SharedPreferencesService>();
  List<Results> favouriteList = [];
  getFavouriteList() async {
  favouriteList = manager.getList<Results>('favouriteList', Results.fromJson);
  }


  Future<void> fetchFavouritesData() async {
  getFavouriteList();
  emit(WishlistLoaded(
  wishList: favouriteList,
  ));
  }

  saveFavourite(Results results) async {
  if (results.isFavourite != null && results.isFavourite == true) {
  for (Results favResults in favouriteList) {
  if (favResults.id == results.id) {
  results.isFavourite = null;
  favouriteList.remove(favResults);
  await manager.removeList('favouriteList');
  await manager.saveList(
  'favouriteList', favouriteList.map((fav) => fav.toJson()).toList());
  fetchFavouritesData();
  }
  }
  }
  }
  }

