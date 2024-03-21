import 'package:flutter/material.dart';
import 'package:ott_app/data/models/movie_model.dart';
import 'package:ott_app/themes/spacing.dart';
import 'package:ott_app/utils/context_extention.dart';

import 'movie_item_widget.dart';

class MovieGridViewWidget extends StatelessWidget {
  const MovieGridViewWidget({Key? key, required this.gridList, required this.onTapCallback}) : super(key: key);

  final List<Results> gridList;
  final Function(Results) onTapCallback;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:  context.isLargeScreen ? 4 : context.isMediumScreen ? 3 : 2,
        crossAxisSpacing: TTNFlixSpacing.spacing20,
        mainAxisSpacing: TTNFlixSpacing.spacing20,
        childAspectRatio: TTNFlixSpacing.spacing1_5,
      ),
      itemCount: gridList.length,
      itemBuilder: (BuildContext context, int index) {
        return MovieItem(
          items: gridList[index],
          isGridView: true,
          onTapCallback: (value) {
            onTapCallback(value);
          },
        );
      },
    );
  }
}