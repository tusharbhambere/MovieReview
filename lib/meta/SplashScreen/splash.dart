import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';
import 'package:movie_review/app/constant.dart';
import 'package:movie_review/meta/MainApp/app.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashPage extends StatelessWidget {
  static const String routename = '/splash_screen';
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenTemplate(
      backgroundColor: Colors.white,
      duration: 2,
      children: [
        Spacer(),
        Image.asset(constant.logo).centered(),
        Spacer(),
      ],
      onDoneTimer: (isTimerDone) =>
          Navigator.of(context).pushReplacementNamed(CoreApp.route),
    );
  }
}
