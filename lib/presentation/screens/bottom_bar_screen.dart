import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ott_app/routes/app_router.gr.dart';
import 'package:ott_app/utils/constant.dart';
@RoutePage()
class BottomTabScreen extends StatelessWidget {
  const BottomTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes:  [
        HomeRoute(),
        FavoriteRoute(),
        ProfileRoute()
      ],

      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (value) {
              tabsRouter.setActiveIndex(value);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: Constant.HOME,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label:  Constant.FAVORITE,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: Constant.PROFILE,
              ),
            ],
          ),
        );
      },
    );
  }
}
