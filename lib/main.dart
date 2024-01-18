
import 'package:flutter/material.dart';
import 'package:ott_app/di/app_module.dart';
import 'package:ott_app/routes/app_router.dart';
import 'package:ott_app/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppModule().initialise();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter =AppRouter();

   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return  ChangeNotifierProvider(
    //     create: (context) => FavoriteProvider(),
      return MaterialApp.router(
      // routerDelegate: _appRouter.delegate(),
          routerConfig: _appRouter.config(),
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
    // routeInformationParser: _appRouter.defaultRouteParser()


    );
  }
}
