import 'package:auto_route/annotations.dart';
import 'package:ott_app/presentation/screens/home_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes:<AutoRoute>[
    AutoRoute(page:HomeScreen,initial:true),
  ]
)
class $AppRouter {}