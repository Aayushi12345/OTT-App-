
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ott_app/data/repositories%20/repository.dart';
import 'package:ott_app/di/app_module.dart';
import 'package:ott_app/logic/cubit/movie_cubit.dart';
import 'package:ott_app/provider/favorite_provider.dart';
import 'package:ott_app/routes/app_router.gr.dart';
import 'package:ott_app/themes/app_theme.dart';
import 'package:provider/provider.dart';

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
    return  ChangeNotifierProvider(
        create: (context) => FavoriteProvider(),
    // return BlocProvider<MovieCubit>(
    //   create: (context) => MovieCubit(Repository())..fetchMovieData(),
      child: MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
    routeInformationParser: _appRouter.defaultRouteParser()
      ),
    // child: ChangeNotifierProvider(create: (context) => LocationServiceProvider(),

    );
  }
}
