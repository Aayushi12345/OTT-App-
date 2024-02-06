// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:ott_app/data/models/movie_model.dart' as _i12;
import 'package:ott_app/presentation/screens/bottom_bar_screen.dart' as _i1;
import 'package:ott_app/presentation/screens/detail_screen.dart' as _i2;
import 'package:ott_app/presentation/screens/Favorite_screen.dart' as _i3;
import 'package:ott_app/presentation/screens/home_screen.dart' as _i4;
import 'package:ott_app/presentation/screens/login_screen.dart' as _i5;
import 'package:ott_app/presentation/screens/profile_account_screen.dart'
    as _i6;
import 'package:ott_app/presentation/screens/Register_screen.dart' as _i7;
import 'package:ott_app/presentation/screens/update_dob_screen.dart' as _i8;
import 'package:ott_app/presentation/screens/update_Name_screen.dart' as _i9;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    BottomTabRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BottomTabScreen(),
      );
    },
    DetailRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.DetailScreen(
          key: args.key,
          movie: args.movie,
        ),
      );
    },
    FavoriteRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.FavoriteScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.HomeScreen(
          key: args.key,
          wishListAction: args.wishListAction,
          isWishlist: args.isWishlist,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.LoginScreen(),
      );
    },
    ProfileAccountRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ProfileAccountScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.RegisterScreen(),
      );
    },
    UpdateDobRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.UpdateDobScreen(),
      );
    },
    UpdateNameRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.UpdateNameScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.BottomTabScreen]
class BottomTabRoute extends _i10.PageRouteInfo<void> {
  const BottomTabRoute({List<_i10.PageRouteInfo>? children})
      : super(
          BottomTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomTabRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DetailScreen]
class DetailRoute extends _i10.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({
    _i11.Key? key,
    required _i12.Results movie,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          DetailRoute.name,
          args: DetailRouteArgs(
            key: key,
            movie: movie,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailRoute';

  static const _i10.PageInfo<DetailRouteArgs> page =
      _i10.PageInfo<DetailRouteArgs>(name);
}

class DetailRouteArgs {
  const DetailRouteArgs({
    this.key,
    required this.movie,
  });

  final _i11.Key? key;

  final _i12.Results movie;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, movie: $movie}';
  }
}

/// generated route for
/// [_i3.FavoriteScreen]
class FavoriteRoute extends _i10.PageRouteInfo<void> {
  const FavoriteRoute({List<_i10.PageRouteInfo>? children})
      : super(
          FavoriteRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i10.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i11.Key? key,
    dynamic Function(
      int,
      bool,
    )? wishListAction,
    bool isWishlist = false,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            key: key,
            wishListAction: wishListAction,
            isWishlist: isWishlist,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i10.PageInfo<HomeRouteArgs> page =
      _i10.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    this.wishListAction,
    this.isWishlist = false,
  });

  final _i11.Key? key;

  final dynamic Function(
    int,
    bool,
  )? wishListAction;

  final bool isWishlist;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, wishListAction: $wishListAction, isWishlist: $isWishlist}';
  }
}

/// generated route for
/// [_i5.LoginScreen]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute({List<_i10.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ProfileAccountScreen]
class ProfileAccountRoute extends _i10.PageRouteInfo<void> {
  const ProfileAccountRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ProfileAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileAccountRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.RegisterScreen]
class RegisterRoute extends _i10.PageRouteInfo<void> {
  const RegisterRoute({List<_i10.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.UpdateDobScreen]
class UpdateDobRoute extends _i10.PageRouteInfo<void> {
  const UpdateDobRoute({List<_i10.PageRouteInfo>? children})
      : super(
          UpdateDobRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpdateDobRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.UpdateNameScreen]
class UpdateNameRoute extends _i10.PageRouteInfo<void> {
  const UpdateNameRoute({List<_i10.PageRouteInfo>? children})
      : super(
          UpdateNameRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpdateNameRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
