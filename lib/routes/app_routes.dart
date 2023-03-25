import 'package:WhaleTunes/default.dart';
import 'package:flutter/material.dart';
import 'package:WhaleTunes/presentation/on_boarding_screen/on_boarding_screen.dart';
import 'package:WhaleTunes/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:WhaleTunes/presentation/home_screen/home_screen.dart';
import 'package:WhaleTunes/presentation/play_screen/play_screen.dart';
import 'package:WhaleTunes/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:WhaleTunes/default.dart';

class AppRoutes {
  static const String defaultScreen = '/';

  static const String onBoardingScreen = '/on_boarding_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String homeScreen = '/home_screen';

  static const String playScreen = '/play_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    defaultScreen: (context) => DefaultScreen(),
    onBoardingScreen: (context) => OnBoardingScreen(),
    signUpScreen: (context) => SignUpScreen(),
    homeScreen: (context) => HomeScreen(),
    playScreen: (context) => PlayScreen(
          URL: '',
        ),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
