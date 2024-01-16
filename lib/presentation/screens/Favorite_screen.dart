import 'package:flutter/material.dart';
import 'package:ott_app/data/models/movie_model.dart';
import 'package:ott_app/provider/favorite_provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imageUrl = 'https://image.tmdb.org/t/p/w185';
    final provider = FavoriteProvider.of(context);
    final favList = provider.title;

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("fav Screen"),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListView.builder(
                        itemCount: favList!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          Results movieResult = favList![index];

                          return Column(
                            children: [
                              ListTile(
                                title:
                                    Text(movieResult!.originalTitle.toString()),
                                leading: SizedBox(
                                    height: 100.0,
                                    width: 100.0, // fixed width and height
                                    child: Image.network(imageUrl +
                                        movieResult.posterPath.toString())),
                                trailing: IconButton(
                                  onPressed: () {
                                    provider.toggleFavorites(movieResult);
                                  },
                                  icon: provider.isExist(movieResult)
                                      ? const Icon(Icons.favorite,
                                          color: Colors.red)
                                      : const Icon(Icons.favorite_border),
                                ),
                              ),
                            ],
                          );
                        },
                      ),

                    ]),
              ),
            )));
  }
}
