import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapAlertDialog extends StatefulWidget {
  @override
  _MapAlertDialogState createState() => _MapAlertDialogState();
}

class _MapAlertDialogState extends State<MapAlertDialog> {
  GoogleMapController? _mapController;

  Location _location = Location();
  LatLng? _lastPosition;
  Set<Marker> _markers = {};
  Set<Polygon> _polygons = {};

  LatLng _fixedLocation = LatLng(33.671568, 72.997692);

  @override
  void initState() {
    super.initState();
    _polygons.add(
      Polygon(
        polygonId: PolygonId("area"),
        visible: true,
        points: [_fixedLocation],
        fillColor: Colors.blue.withOpacity(0.3),
        strokeColor: Colors.blue,
        strokeWidth: 3,
      ),
    );

    _location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        final newLatLng =
        LatLng(currentLocation.latitude!, currentLocation.longitude!);
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
          _polygons.clear();
          _polygons.add(
            Polygon(
              polygonId: PolygonId("area"),
              visible: true,
              points: [_fixedLocation, newLatLng],
              fillColor: Colors.blue.withOpacity(0.3),
              strokeColor: Colors.blue,
              strokeWidth: 3,
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
          polygons: _polygons,
          markers: _markers,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('CANCEL'),
        ),
        TextButton(
          onPressed: () {},
          child: Text('SAVE'),
        ),
      ],
    );
  }
}
