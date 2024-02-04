import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ott_app/logic/wishList/wishlist_cubit.dart';
import 'package:ott_app/logic/wishList/wishlist_state.dart';
import 'package:ott_app/presentation/screens/movie_gridview_widget.dart';
import 'package:ott_app/themes/spacing.dart';
import 'package:ott_app/themes/styles.dart';
import 'package:ott_app/utils/constant.dart';


@RoutePage()
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          Constant.favorite,
          style: Styles.defaultTextTheme.headlineMedium,
        ),
      ),
      body: BlocBuilder<WishListCubit, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoaded) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: TTNFlixSpacing.spacing20,
                  ),
                  if (state.wishList != null)
                    MovieGridViewWidget(
                      gridList: state.wishList!,
                      onTapCallback: (items) {
                        BlocProvider.of<WishListCubit>(context)
                            .saveFavourite(items);
                      },
                    ),
                  const SizedBox(
                    height: TTNFlixSpacing.spacing20,
                  ),
                ],
              ),
            );
          } else if (state is WishlistLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: Text(
                Constant.favorite,
                style: Styles.defaultTextTheme.headlineMedium
                    ?.copyWith(color: Colors.white),
              ),
            );
          }
        },
      ),
    );
  }
}
