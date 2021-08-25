import 'package:flutter/material.dart';
import 'package:global_template/functions/global_function.dart';
import 'package:movie_review/meta/CircleScreen/circle_page.dart';
import 'package:movie_review/meta/MainApp/app.dart';
import 'package:movie_review/meta/SearchScreen/search_page.dart';
import 'package:movie_review/meta/SplashScreen/splash.dart';
import 'package:movie_review/meta/UserScreen/user_page.dart';
import 'package:movie_review/meta/VerifyScreen/verfied_page.dart';
import 'package:movie_review/meta/home/home_page.dart';

class Routes {
  Route<dynamic>? configure(RouteSettings settings) {
    final route = RouteAnimation();
    switch (settings.name) {
      case SplashPage.routename:
        return route.fadeTransition(
          screen: (ctx, animation, secondaryAnimation) => const SplashPage(),
        );
      case CoreApp.route:
        return route.fadeTransition(
          screen: (ctx, animation, secondaryAnimation) => CoreApp(),
        );
      case HomePage.route:
        return route.scaleTransition(
          screen: (ctx, animation, secondaryAnimation) {
            final tabControll = settings.arguments as TabController;
            return HomePage(tabControll);
          },
        );
      case SearchPage.route:
        return route.scaleTransition(
          screen: (ctx, animation, secondaryAnimation) => SearchPage(),
        );
      case CirclePage.route:
        return route.scaleTransition(
          screen: (ctx, animation, secondaryAnimation) => CirclePage(),
        );
      case VerifiedPage.route:
        return route.scaleTransition(
          screen: (ctx, animation, secondaryAnimation) => VerifiedPage(),
        );
      case UserPage.route:
        return route.scaleTransition(
          screen: (ctx, animation, secondaryAnimation) => UserPage(),
        );

      default:
    }
  }
}

final myroute = Routes();
