import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../presentation/login_screen/login_screen.dart';

class MapAlertDialog extends StatefulWidget {
  late String name,address;
  late double latitude, longitude;
  late bool isVisited_Parking;

  MapAlertDialog({required this.name, required this.address,required this.latitude,required this.longitude,required this.isVisited_Parking});
  @override
  _MapAlertDialogState createState() => _MapAlertDialogState();

}

class _MapAlertDialogState extends State<MapAlertDialog> {
  GoogleMapController? _mapController;

  Location _location = Location();
  LatLng? _lastPosition;
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  FirebaseAuth auth = FirebaseAuth.instance;
  late String name,address;
  late double latitude,longitude;
  late bool is_visited;

  @override
  void initState() {
    super.initState();

    name = widget.name;
    address = widget.address;
    latitude = widget.latitude;
    longitude = widget.longitude;
    is_visited = widget.isVisited_Parking;

    LatLng _fixedLocation = LatLng(33.6454867, 72.9727491);

    _polylines.add(
      Polyline(
        polylineId: PolylineId("route"),
        visible: true,
        points: [_fixedLocation],
        color: Colors.blue,
        width: 3,
      ),
    );

    _location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        final newLatLng = LatLng(currentLocation.latitude!, currentLocation.longitude!);
        _lastPosition = newLatLng;
        _markers.clear();
        _markers.add(
          Marker(
            markerId: MarkerId("current_position"),
            position: _fixedLocation,
            icon: BitmapDescriptor.defaultMarker,
          ),
        );

        if (_lastPosition != null) {
          _polylines.clear();
          _polylines.add(
            Polyline(
              polylineId: PolylineId("route"),
              visible: true,
              points: [LatLng(latitude, longitude), newLatLng],
              color: Colors.blue,
              width: 3,
            ),
          );
        }

        if (_mapController != null) {
          _mapController!.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: newLatLng, zoom: 11),
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
          polylines: _polylines,
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
            print('print ----> '+address);
            _Update_DashboardData(name, address, latitude, longitude, is_visited);
          },
          child: Text('SAVE'),
        ),
      ],
    );
  }

  void _Update_DashboardData(String name,String address,double latitude,double longitude, bool isVisited_Parking) async {
    User? user = auth.currentUser;
    if (user != null) {
      String uid = user.uid;
      print('Current user UID: $uid');
      try {
        FirebaseDatabase database = FirebaseDatabase.instance;
        DatabaseReference reference = database.reference().child('users').child(uid);

        reference.update({
          'address': address,
          'latitude': latitude,
          'isVisited_Parking': isVisited_Parking,
          'longitude': longitude,
        }).then((_) {
          print('Data updated successfully.');
          Navigator.of(context).pop();
        }).catchError((error) {
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
