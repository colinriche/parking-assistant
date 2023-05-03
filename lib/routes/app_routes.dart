import 'package:flutter/material.dart';
import 'package:parking_assistant/presentation/about_app_screen/about_app_screen.dart';
import 'package:parking_assistant/presentation/direction_screen/direction_screen.dart';
import 'package:parking_assistant/presentation/login_screen/login_screen.dart';
import 'package:parking_assistant/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:parking_assistant/presentation/home_one_screen/home_screen.dart';
import 'package:parking_assistant/presentation/splash_screen/SplashScreen.dart';
import 'package:parking_assistant/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String aboutAppScreen = '/about_app_screen';

  static const String directionScreen = '/direction_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String loginScreen = '/Login_Screen';

  static const String timerScreen = '/timer_screen';


  static const String myCarsScreen = '/my_cars_screen';

  static const String previousParkingScreen = '/previous_parking_screen';

  static const String mapScreen = '/map_screen';

  static const String homeScreen = '/home_screen';
  static const String splashScreen = '/splash_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    aboutAppScreen: (context) => AboutAppScreen(),
    directionScreen: (context) => DirectionScreen(),
    signUpScreen: (context) => SignUpScreen(),
    loginScreen: (context) => Login_Screen(),
    splashScreen: (context) => Splashscreen(),
    homeScreen: (context) => HomeScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
