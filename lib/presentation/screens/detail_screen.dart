import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ott_app/data/models/movie_model.dart';
import 'package:ott_app/utils/constant.dart';

class DetailScreen extends StatelessWidget {
  final Results movie;

  const DetailScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(movie.title.toString()),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                  child: SizedBox(
                height: 200,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                        Constant.IMAGE_BASE_URL + movie.posterPath.toString(),
                        fit: BoxFit.cover),
                    ClipRRect(
                      // Clip it cleanly.
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          color: Colors.grey.withOpacity(0.1),
                          alignment: Alignment.center,
                          child: Image.network(
                            Constant.IMAGE_BASE_URL +
                                movie.posterPath.toString(),
                            fit: BoxFit.fill,
                            height: 200,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
              SizedBox(
                height: 25,
              ),
              const Text("OverView",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.00,
                      fontWeight: FontWeight.bold)),
              Text(movie.overview.toString()),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text("Release Date : ",
                          style:
                              TextStyle(color: Colors.black, fontSize: 18.00)),
                      Center(
                        child: Text(movie.releaseDate.toString(),
                            style: const TextStyle(
                                color: Colors.green,
                                fontSize: 15.00,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Rating : ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.00,
                          )),
                      Center(
                        child: Text(movie.voteAverage.toString(),
                            style: const TextStyle(
                                color: Colors.green,
                                fontSize: 15.00,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ],
              ),
            ]),
          ),
        ));
  }
}
