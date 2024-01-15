import 'package:auto_route/annotations.dart';
import 'package:ott_app/presentation/screens/Favorite_screen.dart';
import 'package:ott_app/presentation/screens/detail_screen.dart';
import 'package:ott_app/presentation/screens/home_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes:<AutoRoute>[
    AutoRoute(page:HomeScreen,initial:true),
    AutoRoute(page: DetailScreen),
    AutoRoute(page: FavoriteScreen)
  ]
)
class $AppRouter {}