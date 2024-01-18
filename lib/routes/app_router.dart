import 'package:auto_route/auto_route.dart';
import 'package:ott_app/routes/app_router.gr.dart';
import 'app_router.gr.dart';
//
// @MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
//   AutoRoute(page: LoginScreen, initial: true),
//   AutoRoute(page: RegisterScreen),
//   AutoRoute(page: BottomTabScreen, initial: true, children: [
//     AutoRoute(page: HomeScreen),
//     AutoRoute(page: DetailScreen),
//     AutoRoute(page: FavoriteScreen),
//   ])
// ])
// class $AppRouter {}

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: BottomTabRoute.page,
      initial: true,
      children: [
        AutoRoute(page: HomeRoute.page,
        ),
        AutoRoute(page: FavoriteRoute.page),
        AutoRoute(page: ProfileRoute.page),

      ],
    ),
    // AutoRoute(page: HomeRoute.page,initial: true),
      AutoRoute(page: LoginRoute.page),
  AutoRoute(page: RegisterRoute.page),
    AutoRoute(page: DetailRoute.page),
  ];
}

