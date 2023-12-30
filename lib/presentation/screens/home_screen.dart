import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ott_app/data/models/movie_model.dart';
import 'package:ott_app/logic/cubit/movie_cubit.dart';
import 'package:ott_app/logic/cubit/movie_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String imageUrl = 'https://image.tmdb.org/t/p/w185';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Movie List"),
      ),
      body: SafeArea(
        child: BlocConsumer<MovieCubit, MovieState>(
          listener: (context, state) {
            if (state is ErrorState) {
              SnackBar snackBar = SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            if (state is LoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is LoadedState) {
              return buildMovieListView(state.posts);
            }

            return Center(
              child: Text("An error occured!"),
            );
          },
        ),
      ),
    );
  }

  Widget buildMovieListView(MovieModel movieModel) {
    return ListView.builder(
      itemCount: movieModel.results!.length,
      itemBuilder: (context, index) {
        Results movieResult = movieModel.results![index];

        return ListTile(
            title: Text("Country: ${movieResult.originalTitle}"),
            leading: SizedBox(
                height: 100.0,
                width: 100.0, // fixed width and height
                child: Image.network(
                    imageUrl +movieResult.posterPath.toString())));
      },
    );
  }
}
