import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ott_app/logic/cubit/movie_cubit.dart';
import 'package:ott_app/logic/cubit/movie_state.dart';
import 'package:ott_app/logic/wishList/wishlist_cubit.dart';
import 'package:ott_app/presentation/screens/movie_gridview_widget.dart';
import 'package:ott_app/utils/constant.dart';


@RoutePage()
class HomeScreen extends StatelessWidget {
  String imageUrl = Constant.IMAGE_BASE_URL;
  final ScrollController _scrollController = ScrollController();
  WishListCubit wishListCubit = WishListCubit();
  Function(int,bool)? wishListAction;
  final int maxCount = 10;

  ValueNotifier<bool> _wishlist = ValueNotifier<bool>(false);
  late bool isWishlist;

  HomeScreen({super.key,this.wishListAction, this.isWishlist = false}) {
    _wishlist.value = isWishlist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              backgroundColor: Colors.blue,
              title: Text("Movie List"),
            ),
            body: BlocBuilder<MovieCubit, MovieState>(
                builder: (context, state) {
              return state is LoadedState
                  ? SingleChildScrollView(
                      controller: initScrollListener(context),
                      padding: EdgeInsets.only(bottom: 16),
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
                                  itemCount: maxCount,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        SizedBox(
                                          height: 280,
                                          width: MediaQuery.of(context)
                                              .size
                                              .width,
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
                                  margin: const EdgeInsets.only(bottom: 20),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: SizedBox(
                                            height: 10,
                                            child:
                                                state.carouselCurrentPage ==
                                                        index
                                                    ? const Icon(
                                                        Icons.circle,
                                                        size: 8,
                                                        color: Colors.white,
                                                      )
                                                    : const Icon(
                                                        Icons
                                                            .circle_outlined,
                                                        size: 8,
                                                        color: Colors.white,
                                                      )),
                                      );
                                    },
                                    itemCount:maxCount,
                                    scrollDirection: Axis.horizontal,
                                  ),

                                ),
                              ),
                            ]),
                          ),
                          if (state.gridList != null)
                            MovieGridViewWidget(gridList: state.gridList!,
                              onTapCallback: (items) {
                                BlocProvider.of<MovieCubit>(context)
                                    .saveFavourite(items);
                              },),

                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: state.isReachedEnd!
                                  ? const CircularProgressIndicator()
                                  : Container(),
                            ),
                          )
                        ],
                      ),
                    )
                  : state is LoadingState
                      ? const Center(child: CircularProgressIndicator())
                      : state is ErrorState
                          ? const Column()
                          : Container();
            }));
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
