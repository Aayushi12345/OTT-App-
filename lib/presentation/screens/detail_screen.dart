import 'dart:ui';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:ott_app/data/models/movie_model.dart';
import 'package:ott_app/utils/constant.dart';

@RoutePage()
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
          backgroundColor: Colors.blue,

          title: Text(movie.title.toString()),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
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
                      color: Colors.blue.withOpacity(0.1),
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
                            ),
              const SizedBox(
                height: 25,
              ),
               Text(Constant.OVERVIEW,

                  style: Theme.of(context).brightness == Brightness.dark ? const TextStyle(color: Colors.white, fontSize: 16.00,
                  fontWeight: FontWeight.bold) : const TextStyle(color: Colors.black, fontSize: 16.00,
                fontWeight: FontWeight.bold),

                  // style: TextStyle(
                  //     color: Colors.blue,
                  //     fontSize: 16.00,
                  //     fontWeight: FontWeight.bold)
              ),
                  const SizedBox(
                    height: 10,
                  ),

              Text(movie.overview.toString(),
                style: Theme.of(context).brightness == Brightness.dark ? TextStyle(color: Colors.white) : TextStyle(color: Colors.black),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                       Text(Constant.RELEASE_DATE,
                          style: Theme.of(context).brightness == Brightness.dark ? TextStyle(color: Colors.white,fontSize: 18.00) : TextStyle(color: Colors.black,fontSize: 18.00),

                       ),
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
                       Text(Constant.RATING,
                          style: Theme.of(context).brightness == Brightness.dark ? TextStyle(color: Colors.white,fontSize: 18.00) : TextStyle(color: Colors.black,fontSize: 18.00),

                      ),
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
