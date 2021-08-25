import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:global_template/global_template.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_review/core/model/top10.dart';
import 'package:movie_review/core/provider/Api_provider/api.dart';
import 'package:velocity_x/velocity_x.dart';

class TrendingTab extends HookConsumerWidget {
  const TrendingTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final datas = ref.watch(getPerson);
    return datas.when(
      data: (data) {
        return Container(
            child: StaggeredGridView.countBuilder(
          shrinkWrap: true,
          crossAxisCount: 4,
          itemCount: data.length,
          itemBuilder: (context, index) {
            final Result movie = data[index];

            return VxBox(
                    child: VxBox(
                        child: VStack([
              ShowImageNetwork(
                imageBorderRadius: BorderRadius.circular(7),
                width: 2,
                imageUrl: movie.poster.toString(),
                fit: BoxFit.fill,
              ).centered(),
              'Movie Name :'
                  .richText
                  .textStyle(TextStyle(fontSize: 10))
                  .withTextSpanChildren([
                TextSpan(
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    text: "${movie.title}")
              ]).make(),
              'Movie Genre :'
                  .richText
                  .textStyle(TextStyle(fontSize: 10))
                  .withTextSpanChildren([
                TextSpan(
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
                    text: "${movie.genre}")
              ]).make(),
              'Movie Director :'
                  .richText
                  .maxLines(1)
                  .textStyle(TextStyle(fontSize: 10))
                  .withTextSpanChildren([
                TextSpan(
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                    ),
                    text: "${movie.stars}")
              ]).make(),
            ])).make())
                .shadow2xl
                .rounded
                .white
                .make();
          },
          staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(2, index.isEven ? 3.2 : 2.5),
          mainAxisSpacing: 10.0,
          padding: EdgeInsets.only(left: 10, right: 10),
          crossAxisSpacing: 10.0,
        ));
      },
      loading: () {
        return Center(child: CircularProgressIndicator());
      },
      error: (error, stackTrace) {
        return Text(error.toString());
      },
    );
  }
}
