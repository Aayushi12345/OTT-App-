import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ott_app/data/models/movie_model.dart';
import 'package:ott_app/logic/cubit/movie_cubit.dart';
import 'package:ott_app/logic/cubit/movie_state.dart';
import 'package:ott_app/provider/favorite_provider.dart';
import 'package:ott_app/routes/app_router.gr.dart';
import 'package:ott_app/utils/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class _HomeScreenState extends State<HomeScreen> {
  String imageUrl = Constant.IMAGE_BASE_URL;

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
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
    final provider = FavoriteProvider.of(context);
    return BlocProvider<MovieCubit>(
        create: (context) =>MovieCubit(),
    child: MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Movie List"),
        ),
        body: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                autoPlay: true,
              ),
              items: imageSliders,
            ),

            BlocConsumer<MovieCubit, MovieState>(
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
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is LoadedState) {
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 4.0,
                              mainAxisSpacing: 4.0),
                      itemCount: state.posts.results!.length,
                      itemBuilder: (context, index) {
                        Results movieResult = state.posts.results![index];
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                                elevation: 50,
                                shadowColor: Colors.black,
                                color: Colors.greenAccent[100],
                                child: SizedBox(
                                    width: 300,
                                    height: 400,
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(children: [
                                          Image.network(
                                            imageUrl +
                                                movieResult.posterPath
                                                    .toString(),
                                            fit: BoxFit.fill,
                                            height: 100,
                                            width: 400,
                                          ), //NetworkImage

                                          Row(
                                            // crossAxisAlignment:
                                            // CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                movieResult.originalTitle
                                                    .toString(),
                                                maxLines: 3,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.green[900],
                                                  fontWeight: FontWeight.w500,
                                                ), //Textstyle
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  provider.toggleFavorites(movieResult);
                                                },
                                                  // icon:
                                                icon:provider.isExist(movieResult)?
                                                  const
                                                Icon(Icons.favorite, color: Colors.red)
                                                      : Icon(Icons.favorite, color: Colors.white)
                                              )
                                            ],
                                          ), //Text
                                        ]
                                        )

                                    )
                                )
                            )

                        );
                      },
                    ),

                  );

                  // return buildMovieListView(state.posts);
                }

                return const Center(
                  child: Text("An error occured!"),
                );
              },
            )

          ],

        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            context.router.push(const FavoriteScreen() );

          },
          label: const Text('Favorites'),
        ),
      ),
    )
    );
  }

// Widget buildMovieListView(MovieModel movieModel) {
//   return ListView.builder(
//     itemCount: movieModel.results!.length,
//     itemBuilder: (context, index) {
//       Results movieResult = movieModel.results![index];
//
//       return Column(
//         children: [
//           // Padding(
//           //   padding: const EdgeInsets.all(28.0),
//           //
//           // ),
//           ListTile(
//               title: Text(movieResult.originalTitle.toString()),
//               leading: SizedBox(
//                   height: 100.0,
//                   width: 100.0, // fixed width and height
//                   child: Image.network(
//                       imageUrl + movieResult.posterPath.toString()))),
//         ],
//       );
//     },
//   );
// }
}
