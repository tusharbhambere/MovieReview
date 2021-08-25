import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_review/core/provider/global_providerl/global_provider.dart';
import 'package:movie_review/meta/CircleScreen/circle_page.dart';
import 'package:movie_review/meta/MainApp/widget/bootom_nav.dart';
import 'package:movie_review/meta/SearchScreen/search_page.dart';
import 'package:movie_review/meta/UserScreen/user_page.dart';
import 'package:movie_review/meta/VerifyScreen/verfied_page.dart';
import 'package:movie_review/meta/home/home_page.dart';

import 'widget/appbar.dart';

class CoreApp extends ConsumerStatefulWidget {
  static const route = 'Main_app';

  const CoreApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<CoreApp> with TickerProviderStateMixin {
  late final PageController _pageController;
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _pageController = PageController(initialPage: ref.read(cureentIndex).state);
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: TopAppBar(
        appBar: AppBar(),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) => ref.read(cureentIndex).state = value,
        children: [
          HomePage(_tabController),
          SearchPage(),
          CirclePage(),
          VerifiedPage(),
          UserPage()
        ],
      ),
      bottomNavigationBar: BotoomNav(
        pageController: _pageController,
      ),
    );
  }
}
