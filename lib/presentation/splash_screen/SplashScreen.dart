import 'package:flutter/material.dart';
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
    _check_auth();
  }

  void _check_auth() async {
    try {
      if (await _auth.islogin()){
        // _auth.signOut();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }else{
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    } catch (error) {
      print(error);
    }
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