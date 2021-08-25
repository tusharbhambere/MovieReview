import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_review/app/constant.dart';
import 'package:movie_review/meta/home/widget/activity.dart';
import 'package:movie_review/meta/home/widget/food.dart';
import 'package:movie_review/meta/home/widget/show.dart';
import 'package:movie_review/meta/home/widget/trending.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends HookConsumerWidget {
  final TabController _controller;
  static const String route = '/home_page';
  const HomePage(this._controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return VStack([
      TabBar(
        controller: _controller,
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: Colors.transparent,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black,
        tabs: [
          Tab(
            child: VxBox(child: Text('#Trending').centered())
                .roundedSM
                .color(constant.primaryColor)
                .height(25)
                .width(75)
                .make(),
          ),
          Tab(
            child: VxBox(child: Text('#Food').centered())
                .roundedSM
                .height(25)
                .border(
                    color: constant.primaryColor.withOpacity(0.4),
                    style: BorderStyle.solid)
                .width(75)
                .make(),
          ),
          Tab(
            child: VxBox(child: Text('#Activity').centered())
                .roundedSM
                .height(25)
                .border(
                    color: constant.primaryColor.withOpacity(0.4),
                    style: BorderStyle.solid)
                .width(75)
                .make(),
          ),
          Tab(
            child: VxBox(child: Text('#Showcase').centered())
                .roundedSM
                .height(25)
                .border(
                    color: constant.primaryColor.withOpacity(0.4),
                    style: BorderStyle.solid)
                .width(75)
                .make(),
          ),
        ],
      ),
      Expanded(
          child: TabBarView(
              controller: _controller,
              children: [TrendingTab(), FoodTab(), ActivityTab(), ShowTab()]))
    ]);
  }
}
