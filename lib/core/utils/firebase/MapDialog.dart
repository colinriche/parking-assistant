import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MapAlertDialog extends StatefulWidget {
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final bool isVisitedParking;

  MapAlertDialog({
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.isVisitedParking,
  });

  @override
  _MapAlertDialogState createState() => _MapAlertDialogState();
}

class _MapAlertDialogState extends State<MapAlertDialog> {
  Completer<GoogleMapController> _mapControllerCompleter = Completer();
  Set<Polyline> _polylines = {};

  // Define your API key
  final String apiKey = 'AIzaSyCxzZvKT560MJWr4AGMdtExenoqrc2CCrY';

  @override
  void initState() {
    super.initState();
    _fetchRoute();
  }

  Future<void> _fetchRoute() async {
    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/directions/json?origin=${widget.latitude},${widget.longitude}&destination=${widget.latitude},${widget.longitude}&key=$apiKey'));

    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);

      final points =
      decodedResponse['routes'][0]['overview_polyline']['points'];

      setState(() {
        _polylines.clear();
        _polylines.add(Polyline(
          polylineId: PolylineId('route'),
          points: _decodePolyline(points),
          color: Colors.blue,
          width: 5,
        ));
      });

      _fitBounds();
    } else {
      print('Error ${response.statusCode}');
    }
  }

  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> decodedPolyline = [];
    int index = 0;
    int lat = 0;
    int lng = 0;
    int byte = 0;

    while (index < encoded.length) {
      int shift = 0;
      int result = 0;

      do {
        byte = encoded.codeUnitAt(index++) - 63;
        result |= (byte & 0x1F) << (shift * 5);
        shift++;
      } while (byte >= 0x20);

      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;

      do {
        byte = encoded.codeUnitAt(index++) - 63;
        result |= (byte & 0x1F) << (shift * 5);
        shift++;
      } while (byte >= 0x20);

      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      double latitude = lat / 1e5;
      double longitude = lng / 1e5;

      decodedPolyline.add(LatLng(latitude, longitude));
    }

    return decodedPolyline;
  }

  void _fitBounds() async {
    final GoogleMapController controller = await _mapControllerCompleter.future;
    final LatLngBounds bounds = _boundsFromLatLngList(_polylines.first.points);
    controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 100));
  }

 LatLngBounds _boundsFromLatLngList(List<LatLng> list) {
    double minLat = double.infinity;
    double maxLat = -double.infinity;
    double minLng = double.infinity;
    double maxLng = -double.infinity;

    for (LatLng point in list) {
      if (point.latitude < minLat) {
        minLat = point.latitude;
      }
      if (point.latitude > maxLat) {
        maxLat = point.latitude;
      }
      if (point.longitude < minLng) {
        minLng = point.longitude;
      }
      if (point.longitude > maxLng) {
        maxLng = point.longitude;
      }
    }

    final LatLng southwest = LatLng(minLat, minLng);
    final LatLng northeast = LatLng(maxLat, maxLng);

    return LatLngBounds(southwest: southwest, northeast: northeast);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 450,
        width: 500,
        child: GoogleMap(
          onMapCreated: (controller) {
            _mapControllerCompleter.complete(controller);
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.latitude, widget.longitude),
            zoom: 18,
          ),
          polylines: _polylines,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('CANCEL'),
        ),
        TextButton(
          onPressed: () {
            print('print ----> ' + widget.address);
            _updateDashboardData(
              widget.name,
              widget.address,
              widget.latitude,
              widget.longitude,
              widget.isVisitedParking,
            );
          },
          child: Text('SAVE'),
        ),
      ],
    );
  }

  void _updateDashboardData(
      String name,
      String address,
      double latitude,
      double longitude,
      bool isVisitedParking,
      ) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String uid = user.uid;
      print('Current user UID: $uid');
      try {
        FirebaseDatabase database = FirebaseDatabase.instance;
        DatabaseReference reference =
        database.reference().child('users').child(uid);

        reference.update({
          'address': address,
          'latitude': latitude,
          'isVisitedParking': isVisitedParking,
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
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(builder: (context) => LoginScreen()),
      // );
    }
  }
}
