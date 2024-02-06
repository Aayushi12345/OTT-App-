import 'package:auto_route/auto_route.dart';
import 'package:ott_app/routes/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: BottomTabRoute.page,
          initial: false,
          children: [
            AutoRoute(
              page: HomeRoute.page,
            ),
            AutoRoute(page: FavoriteRoute.page),
            AutoRoute(page: ProfileAccountRoute.page),
          ],
        ),
        AutoRoute(page: LoginRoute.page,initial: true),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: DetailRoute.page),
        AutoRoute(page: UpdateDobRoute.page),
    AutoRoute(page: UpdateNameRoute.page),
      ];
}
