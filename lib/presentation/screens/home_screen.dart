import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ott_app/data/models/movie_model.dart';
import 'package:ott_app/logic/cubit/movie_cubit.dart';
import 'package:ott_app/logic/cubit/movie_state.dart';
import 'package:ott_app/routes/app_router.gr.dart';

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

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: TextButton(
                  onPressed: () {
                    context.router.push(DetailScreen(name: "Aayu", id: 1) );
                    // mytext = "";
                  },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.all(16.0),
                    foregroundColor: Colors.black,
                    textStyle: TextStyle(fontSize: 20)),
                child: Text('Detail Screen'),
              ),
            ),
            ListTile(
                title: Text(movieResult.originalTitle.toString()),
                leading: SizedBox(
                    height: 100.0,
                    width: 100.0, // fixed width and height
                    child: Image.network(
                        imageUrl +movieResult.posterPath.toString()))),
          ],
        );
      },
    );
  }
}
