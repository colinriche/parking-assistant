import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../presentation/login_screen/login_screen.dart';

class MapAlertDialog extends StatefulWidget {
  late String name, address;
  late double latitude, longitude;
  late bool isVisited_Parking;

  MapAlertDialog(
      {required this.name,
        required this.address,
        required this.latitude,
        required this.longitude,
        required this.isVisited_Parking});

  @override
  _MapAlertDialogState createState() => _MapAlertDialogState();
}

class _MapAlertDialogState extends State<MapAlertDialog> {
  GoogleMapController? _mapController;

  Location _location = Location();
  LatLng? _lastPosition;
  Set<Marker> _markers = {};
  Set<Polygon> _polygons = {}; // Updated to polygons
  FirebaseAuth auth = FirebaseAuth.instance;
  late String name, address;
  late double latitude, longitude;
  late bool is_visited;

  @override
  void initState() {
    super.initState();

    name = widget.name;
    address = widget.address;
    latitude = widget.latitude;
    longitude = widget.longitude;
    is_visited = widget.isVisited_Parking;

    _location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        final newLatLng =
        LatLng(currentLocation.latitude!, currentLocation.longitude!);
        _lastPosition = newLatLng;
        _markers.clear();


        if (_lastPosition != null) {
          _polygons.clear();

          _polygons.add(
            Polygon(
              polygonId: PolygonId("route"),
              visible: true,
              points: [LatLng(latitude, longitude), newLatLng],
              fillColor: Colors.deepPurple,
              strokeColor:  Colors.deepPurple,
              strokeWidth: 2,
            ),
          );
        }

        if (_mapController != null) {
          _mapController!.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: newLatLng, zoom: 14),
          ));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 350,
        width: 400,
        child: GoogleMap(
          onMapCreated: (controller) => _mapController = controller,
          initialCameraPosition: CameraPosition(target: LatLng(0, 0)),
          myLocationEnabled: true,
          polygons: _polygons, // Updated to polygons
          markers: _markers,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('CANCEL'),
        ),
        TextButton(
          onPressed: () {
            print('print ----> ' + address);
            _Update_DashboardData(
                name, address, latitude, longitude, is_visited);
          },
          child: Text('SAVE'),
        ),
      ],
    );
  }

  void _Update_DashboardData(
      String name,
      String address,
      double latitude,
      double longitude,
      bool isVisited_Parking,
      ) async {
    User? user = auth.currentUser;
    if (user != null) {
      String uid = user.uid;
      print('Current user UID: $uid');
      try {
        FirebaseDatabase database = FirebaseDatabase.instance;
        DatabaseReference reference =
        database.reference().child('users').child(uid);

        reference
            .update({
          'address': address,
          'latitude': latitude,
          'isVisited_Parking': isVisited_Parking,
          'longitude': longitude,
        })
            .then((_) {
          print('Data updated successfully.');
          Navigator.of(context).pop();
        })
            .catchError((error) {
          Navigator.of(context).pop();
          print('Data could not be updated: $error');
        });

      } catch (error) {
        print(error);
      }
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Login_Screen()),
      );
    }
  }
}

