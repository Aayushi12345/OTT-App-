// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../data/models/movie_model.dart' as _i6;
import '../presentation/screens/detail_screen.dart' as _i2;
import '../presentation/screens/Favorite_screen.dart' as _i3;
import '../presentation/screens/home_screen.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeScreen.name: (routeData) {
      final args = routeData.argsAs<HomeScreenArgs>(
          orElse: () => const HomeScreenArgs());
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.HomeScreen(key: args.key),
      );
    },
    DetailScreen.name: (routeData) {
      final args = routeData.argsAs<DetailScreenArgs>();
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.DetailScreen(
          key: args.key,
          movie: args.movie,
        ),
      );
    },
    FavoriteScreen.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.FavoriteScreen(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          HomeScreen.name,
          path: '/',
        ),
        _i4.RouteConfig(
          DetailScreen.name,
          path: '/detail-screen',
        ),
        _i4.RouteConfig(
          FavoriteScreen.name,
          path: '/favorite-screen',
        ),
      ];
}

/// generated route for
/// [_i1.HomeScreen]
class HomeScreen extends _i4.PageRouteInfo<HomeScreenArgs> {
  HomeScreen({_i5.Key? key})
      : super(
          HomeScreen.name,
          path: '/',
          args: HomeScreenArgs(key: key),
        );

  static const String name = 'HomeScreen';
}

class HomeScreenArgs {
  const HomeScreenArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'HomeScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.DetailScreen]
class DetailScreen extends _i4.PageRouteInfo<DetailScreenArgs> {
  DetailScreen({
    _i5.Key? key,
    required _i6.Results movie,
  }) : super(
          DetailScreen.name,
          path: '/detail-screen',
          args: DetailScreenArgs(
            key: key,
            movie: movie,
          ),
        );

  static const String name = 'DetailScreen';
}

class DetailScreenArgs {
  const DetailScreenArgs({
    this.key,
    required this.movie,
  });

  final _i5.Key? key;

  final _i6.Results movie;

  @override
  String toString() {
    return 'DetailScreenArgs{key: $key, movie: $movie}';
  }
}

/// generated route for
/// [_i3.FavoriteScreen]
class FavoriteScreen extends _i4.PageRouteInfo<void> {
  const FavoriteScreen()
      : super(
          FavoriteScreen.name,
          path: '/favorite-screen',
        );

  static const String name = 'FavoriteScreen';
}
