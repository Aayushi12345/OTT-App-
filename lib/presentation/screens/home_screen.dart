
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ott_app/data/models/movie_model.dart';
import 'package:ott_app/data/repositories%20/repository.dart';
import 'package:ott_app/logic/cubit/movie_cubit.dart';
import 'package:ott_app/logic/cubit/movie_state.dart';
import 'package:ott_app/utils/constant.dart';

import '../../routes/app_router.gr.dart';
@RoutePage()
class HomeScreen extends StatelessWidget {
    HomeScreen({
    Key? key,
  }) : super(key: key);

  // HomeScreen({super.key});

  String imageUrl = Constant.IMAGE_BASE_URL;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    // final provider = FavoriteProvider.of(context);
    return BlocProvider<MovieCubit>(
        create: (context) => MovieCubit(Repository())..loadSecondPageOfMovie(),
        child: MaterialApp(
            home: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text("Movie List"),
                ),
                body: BlocBuilder<MovieCubit, MovieState>(
                    builder: (context, state) {
                  return state is LoadedState
                      ? SingleChildScrollView(
                          controller: initScrollListener(context),
                          padding:  EdgeInsets.only(bottom: 16),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 320,
                                child: Stack(children: [
                                  PageView.builder(
                                      controller: context
                                          .read<MovieCubit>()
                                          .pageController,
                                      onPageChanged: (int page) {
                                        BlocProvider.of<MovieCubit>(context)
                                            .updateDotIndicator(page);
                                      },
                                      itemCount: state.carouselList?.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            SizedBox(
                                                height: 280,
                                              width: MediaQuery.of(context).size.width,
                                              child: Image.network(
                                                "${Constant.IMAGE_BASE_URL}${state.carouselList![index].backdropPath ?? ''}",
                                                      fit: BoxFit.cover,

                                              ),
                                            )
                                          ],
                                        );
                                      }),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      height: 120,
                                      margin:  EdgeInsets.only(bottom: 20),
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding:  EdgeInsets.all(5),
                                            child: SizedBox(
                                                height: 10,
                                                child:
                                                    state.carouselCurrentPage ==
                                                            index
                                                        ?  const Icon(
                                                            Icons.circle,
                                                            size: 8,
                                                            color: Colors.white,
                                                          )
                                                        :  const Icon(
                                                            Icons
                                                                .circle_outlined,
                                                            size: 8,
                                                            color: Colors.white,
                                                          )),
                                          );
                                        },
                                        itemCount: state.carouselList?.length,
                                        scrollDirection: Axis.horizontal,
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                              GridView.builder(
                                physics:  const NeverScrollableScrollPhysics(),

                                shrinkWrap: true,
                                gridDelegate:
                                     const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 4.0,
                                        mainAxisSpacing: 4.0),
                                itemCount: state.gridList!.length,
                                itemBuilder: (context, index) {
                                  Results movieResult = state.gridList![index];
                                  return Padding(
                                      padding:  EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: (){
                                          context.router.push(DetailRoute(movie: movieResult));
                                          },
                                        child: Card(
                                            elevation: 50,
                                            shadowColor: Colors.black,
                                            color: Colors.greenAccent[100],
                                            child: SizedBox(
                                                width: 300,
                                                height: 400,
                                                child: Padding(

                                                    padding:
                                                         EdgeInsets.all(8.0),
                                                    child: Column(children: [
                                                      Image.network(
                                                        imageUrl +
                                                            movieResult.posterPath
                                                                .toString(),
                                                        fit: BoxFit.fill,
                                                        height: 100,
                                                        width: 400,
                                                      ),
                                                      //NetworkImage

                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        // crossAxisAlignment:
                                                        // CrossAxisAlignment.end,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              movieResult
                                                                  .originalTitle
                                                                  .toString(),
                                                              maxLines: 2,
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .green[900],
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ), //Textstyle
                                                            ),
                                                          ),
                                                          IconButton(
                                                              onPressed: () {
                                                                // provider
                                                                //     .toggleFavorites(
                                                                //         movieResult);
                                                              },
                                                              icon:
                                                              // icon: provider.isExist(
                                                              //         movieResult)
                                                                   Icon(
                                                                      Icons
                                                                          .favorite,
                                                                      color: Colors
                                                                          .red)
                                                                  // :  Icon(
                                                                  //     Icons
                                                                  //         .favorite,
                                                                  //     color: Colors
                                                                  //         .white)
                                      )
                                                        ],
                                                      ),
                                                      //Text
                                                    ])))),
                                      ));
                                },
                              ),
                              Padding(
                                padding:  EdgeInsets.only(bottom: 16),
                                child: state.isReachedEnd
                                    ?  CircularProgressIndicator()
                                    : Container(),
                              )
                            ],
                          ),
                        )
                      : state is LoadingState
                          ? CircularProgressIndicator()
                          : state is ErrorState
                              ?  Column()
                              : Container();
                }))));
  }

  ScrollController initScrollListener(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        BlocProvider.of<MovieCubit>(context).loadMore();
      }
    });

    return _scrollController;
  }
}
