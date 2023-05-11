import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MapAlertDialog extends StatefulWidget {
  @override
  _MapAlertDialogState createState() => _MapAlertDialogState();
}

class _MapAlertDialogState extends State<MapAlertDialog> {
  GoogleMapController? _mapController;

  Location _location = Location();
  LatLng? _lastPosition;
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  LatLng _fixedLocation = LatLng(33.6454867, 72.9727491);
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

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
              points: [_fixedLocation, newLatLng],
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
         //   _Update_DashboardData();
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
        }).catchError((error) {
          print('Data could not be updated: $error');
        });

      } catch (error) {
        print(error);
      }
    } else {
      print('User is not authenticated.');
    }

  }
}
