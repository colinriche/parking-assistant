import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:geofence_service/models/geofence.dart';
import 'package:geofence_service/models/geofence_radius.dart';
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
  var _geofenceList = <Geofence>[];
  @override
  void initState() {
    super.initState();
    _FetchDashboardData();
  }

  void _check_auth() async {
    try {
      if (await _auth.islogin()){
        // _auth.signOut();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen(geofenceList: _geofenceList)),
        );
      }else{
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen(geofenceList: _geofenceList)),
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


  _FetchDashboardData() async {
    final completer = Completer<List<Geofence>>();
    FirebaseDatabase database = FirebaseDatabase.instance;
    DatabaseReference parkingRef = database.reference().child('parking_locations');
    parkingRef.onValue.listen((event) async {
      Map<dynamic, dynamic> parkingsMap = event.snapshot.value as Map<dynamic, dynamic>;
      if (parkingsMap != null) {
        final temp_geofenceList = <Geofence>[];
        parkingsMap.forEach((key, value) {
          Map<String, dynamic> parking = Map.from(value);
          temp_geofenceList.add(
            Geofence(
              id: '1',
              latitude: parking['latitude'].toDouble(),
              longitude: parking['longitude'].toDouble(),
              radius: [
                GeofenceRadius(
                  id: '1',
                  length: 25,
                ),
              ],
            ),
          );
        });
        completer.complete(temp_geofenceList);
        _geofenceList = temp_geofenceList;
        _check_auth();
        // Complete the completer with the geofence list
      }
    });

    return completer.future; // Return the future from the completer
  }
}