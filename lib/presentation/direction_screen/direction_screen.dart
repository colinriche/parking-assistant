import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:location/location.dart';

import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_decoration.dart';
import '../../widgets/app_bar/appbar_iconbutton.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class DirectionScreen extends StatefulWidget {
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final bool isVisitedParking;

  DirectionScreen({
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.isVisitedParking,
  });

  @override
  _DirectionScreenState createState() => _DirectionScreenState();
}

class _DirectionScreenState extends State<DirectionScreen> {
  Completer<GoogleMapController> _mapControllerCompleter = Completer();
  Set<Polyline> _polylines = {};
  Location _location = Location();

  // Define your API key
  final String apiKey = 'AIzaSyD2QNHMF8aV2P8wfDVsAgyv9S0n0p4tJU8';

  @override
  void initState() {
    super.initState();
    _fetchRoute();
    _getCurrentLocation();
  }

  Future<void> _fetchRoute() async {
    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/directions/json?origin=33.6419444,72.9649747&destination=${widget.latitude},${widget.longitude}&key=$apiKey'));

    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);

      final points = decodedResponse['routes'][0]['overview_polyline']['points'];

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

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    LocationData currentLocation = await _location.getLocation();
    LatLng currentLatLng = LatLng(
      currentLocation.latitude!,
      currentLocation.longitude!,
    );

    final GoogleMapController controller = await _mapControllerCompleter.future;
    controller.animateCamera(CameraUpdate.newLatLng(currentLatLng));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              child: Container(
                padding: getPadding(
                  top: 8,
                  bottom: 8,
                ),
                decoration: AppDecoration.outlineIndigoA20033.copyWith(
                  borderRadius: BorderRadiusStyle.customBorderBL30,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomAppBar(
                      height: getVerticalSize(
                        33,
                      ),
                      leadingWidth: 48,
                      leading: AppbarIconbutton(
                        svgPath: ImageConstant.imgMenu,
                        margin: getMargin(
                          left: 16,
                          bottom: 1,
                        ),
                      ),
                      centerTitle: true,
                      title: AppbarTitle(
                        text: "Home",
                      ),
                      actions: [
                        Container(
                          margin: getMargin(
                            left: 16,
                            top: 1,
                            right: 16,
                          ),
                          padding: getPadding(
                            left: 6,
                            top: 4,
                            right: 6,
                            bottom: 4,
                          ),
                          decoration: AppDecoration.fillBlue50.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder6,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AppbarImage(
                                height: getVerticalSize(
                                  24,
                                ),
                                width: getHorizontalSize(
                                  17,
                                ),
                                imagePath:
                                ImageConstant.imgToyfacestansparentbg29,
                                margin: getMargin(
                                  right: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),

            Container(
              padding: getPadding(
                top: 25,
                bottom: 25,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: getVerticalSize(
                      500,
                    ),
                    width: getHorizontalSize(
                      362,
                    ),
                    child:
                    GoogleMap(
                      onMapCreated: (controller) {
                        _mapControllerCompleter.complete(controller);
                      },
                      initialCameraPosition: CameraPosition(
                        target: LatLng(widget.latitude, widget.longitude),
                        zoom: 18,
                      ),
                      polylines: _polylines,
                    )
                  ),


                ],
              ),
            ),


          ],
        )
      ),
    );
  }
}
