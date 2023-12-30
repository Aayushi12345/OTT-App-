import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ott_app/logic/cubit/movie_cubit.dart';
import 'package:ott_app/presentation/screens/home_screen.dart';
import 'package:ott_app/routes/app_router.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter =AppRouter();

   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit(),
      child: MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
    routeInformationParser: _appRouter.defaultRouteParser()
      ),
    );
  }
}
