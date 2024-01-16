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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../data/models/movie_model.dart' as _i8;
import '../presentation/screens/detail_screen.dart' as _i2;
import '../presentation/screens/Favorite_screen.dart' as _i3;
import '../presentation/screens/home_screen.dart' as _i1;
import '../presentation/screens/login_screen.dart' as _i4;
import '../presentation/screens/Register_screen.dart' as _i5;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomeScreen.name: (routeData) {
      final args = routeData.argsAs<HomeScreenArgs>(
          orElse: () => const HomeScreenArgs());
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.HomeScreen(key: args.key),
      );
    },
    DetailScreen.name: (routeData) {
      final args = routeData.argsAs<DetailScreenArgs>();
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.DetailScreen(
          key: args.key,
          movie: args.movie,
        ),
      );
    },
    FavoriteScreen.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.FavoriteScreen(),
      );
    },
    LoginScreen.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.LoginScreen(),
      );
    },
    RegisterScreen.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.RegisterScreen(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          HomeScreen.name,
          path: '/home-screen',
        ),
        _i6.RouteConfig(
          DetailScreen.name,
          path: '/detail-screen',
        ),
        _i6.RouteConfig(
          FavoriteScreen.name,
          path: '/favorite-screen',
        ),
        _i6.RouteConfig(
          LoginScreen.name,
          path: '/',
        ),
        _i6.RouteConfig(
          RegisterScreen.name,
          path: '/register-screen',
        ),
      ];
}

/// generated route for
/// [_i1.HomeScreen]
class HomeScreen extends _i6.PageRouteInfo<HomeScreenArgs> {
  HomeScreen({_i7.Key? key})
      : super(
          HomeScreen.name,
          path: '/home-screen',
          args: HomeScreenArgs(key: key),
        );

  static const String name = 'HomeScreen';
}

class HomeScreenArgs {
  const HomeScreenArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'HomeScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.DetailScreen]
class DetailScreen extends _i6.PageRouteInfo<DetailScreenArgs> {
  DetailScreen({
    _i7.Key? key,
    required _i8.Results movie,
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

  final _i7.Key? key;

  final _i8.Results movie;

  @override
  String toString() {
    return 'DetailScreenArgs{key: $key, movie: $movie}';
  }
}

/// generated route for
/// [_i3.FavoriteScreen]
class FavoriteScreen extends _i6.PageRouteInfo<void> {
  const FavoriteScreen()
      : super(
          FavoriteScreen.name,
          path: '/favorite-screen',
        );

  static const String name = 'FavoriteScreen';
}

/// generated route for
/// [_i4.LoginScreen]
class LoginScreen extends _i6.PageRouteInfo<void> {
  const LoginScreen()
      : super(
          LoginScreen.name,
          path: '/',
        );

  static const String name = 'LoginScreen';
}

/// generated route for
/// [_i5.RegisterScreen]
class RegisterScreen extends _i6.PageRouteInfo<void> {
  const RegisterScreen()
      : super(
          RegisterScreen.name,
          path: '/register-screen',
        );

  static const String name = 'RegisterScreen';
}
