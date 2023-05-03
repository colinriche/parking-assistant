import 'dart:async';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:parking_assistant/presentation/home_one_screen/home_screen.dart';
import 'package:parking_assistant/core/app_export.dart';
import 'package:parking_assistant/presentation/login_screen/login_screen.dart';

import '../../core/utils/firebase/AuthService.dart';

class Splashscreen extends StatefulWidget {
  Splashscreen({Key? key}) : super(key: key);
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  final AuthService _auth = AuthService();
  @override
  void initState() {
    super.initState();
    requestLocationPermission();
  }

  Future<void> requestLocationPermission() async {
    final location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    // Check if location services are enabled
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    // Check if location permission is granted
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    // Wait for 1 seconds before navigating to the home screen
    Timer(Duration(seconds: 1), () async {

      if (await _auth.islogin()){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }else{
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Login_Screen()),
        );
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray50,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 32,
            top: 20,
            right: 32,
            bottom: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgScreenshot20210525,
                height: getSize(84),
                width: getSize(84),
                radius: BorderRadius.circular(
                  getHorizontalSize(
                    12,
                  ),
                ),
                alignment: Alignment.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}