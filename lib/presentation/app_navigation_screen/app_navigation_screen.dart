import 'dart:async';
import 'package:easy_geofencing/easy_geofencing.dart';
import 'package:easy_geofencing/enums/geofence_status.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class AppNavigationScreen extends StatefulWidget {
  @override
  _AppNavigationScreenState createState() => _AppNavigationScreenState();
}

class _AppNavigationScreenState extends State<AppNavigationScreen> {
  StreamSubscription<GeofenceStatus>? geofenceStatusStream;
  Geolocator geolocator = Geolocator();
  String geofenceStatus = '';
  bool isReady = false;
  Position? position;
  @override
  void initState() {
    super.initState();
    getCurrentPosition();
  }

  getCurrentPosition() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print("LOCATION => ${position!.toJson()}");
    isReady = (position != null) ? true : false;
  }

  setLocation() async {
    await getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text("Start"),
                  onPressed: () {
                    print("starting geoFencing Service");
                    EasyGeofencing.startGeofenceService(
                        pointedLatitude: position!.latitude.toString(),
                        pointedLongitude: position!.longitude.toString(),
                        radiusMeter: "10.0",
                        eventPeriodInSeconds: 5);
                    if (geofenceStatusStream == null) {
                      geofenceStatusStream = EasyGeofencing.getGeofenceStream()!
                          .listen((GeofenceStatus status) {
                        print(status.toString());
                        setState(() {
                          geofenceStatus = status.toString();
                        });
                      });
                    }
                  },
                ),
                SizedBox(
                  width: 10.0,
                ),
                ElevatedButton(
                  child: Text("Stop"),
                  onPressed: () {
                    print("stop");
                    EasyGeofencing.stopGeofenceService();
                    geofenceStatusStream!.cancel();
                  },
                ),

              ],
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              "Geofence Status: \n\n\n" + geofenceStatus,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}