
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ott_app/di/app_module.dart';
import 'package:ott_app/routes/app_router.dart';
import 'package:ott_app/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppModule().initialise();
   Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter =AppRouter();

   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
      return MaterialApp.router(
          routerConfig: _appRouter.config(),
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
    );
  }
}
