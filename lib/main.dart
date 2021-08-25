import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_review/app/routes.dart';
import 'package:movie_review/app/theme.dart';
import 'package:movie_review/meta/SplashScreen/splash.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecomerce',
      theme: AppThemes.light,
      home: SplashPage(),
      onGenerateRoute: myroute.configure,
    );
  }
}
