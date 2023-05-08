import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:geofence_service/geofence_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../core/utils/firebase/AuthService.dart';
import '../home_one_screen/widgets/listsetpickuppo_item_widget.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:parking_assistant/core/app_export.dart';
import 'package:parking_assistant/widgets/app_bar/appbar_iconbutton.dart';
import 'package:parking_assistant/widgets/app_bar/appbar_image.dart';
import 'package:parking_assistant/widgets/app_bar/appbar_title.dart';
import 'package:parking_assistant/widgets/app_bar/custom_app_bar.dart';
import 'package:parking_assistant/widgets/custom_icon_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreen_State createState() => _HomeScreen_State();
}

class _HomeScreen_State extends State<HomeScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final AuthService _auth = AuthService();
  List<Map<String, dynamic>> parking = [];
  late String name = '';
  late String _address = '';
  late double _latitude = 0.0;
  late double _longitude = 0.0;
  late bool is_visited = false;
  final _geofenceStreamController = StreamController<Geofence>();
  final _geofenceService = GeofenceService.instance.setup(
      interval: 5000,
      accuracy: 100,
      loiteringDelayMs: 60000,
      statusChangeDelayMs: 10000,
      useActivityRecognition: true,
      allowMockLocations: false,
      printDevLog: false,
      geofenceRadiusSortType: GeofenceRadiusSortType.DESC);

  final _geofenceList = <Geofence>[
    Geofence(
        id: 'place_1',
        latitude: 52.0404497,
        longitude: -0.7493338,
        radius: [
          GeofenceRadius(id: 'radius_25m', length: 15)]
    ),
    Geofence(
      id: 'place_2',
      latitude: 52.0408197,
      longitude: -0.7504911,
      radius: [
        GeofenceRadius(id: 'radius_25m', length: 15),
      ],
    ),
    Geofence(
      id: 'place_3',
      latitude: 52.03938873985288,
      longitude: -0.7513414498805204,
      radius: [
        GeofenceRadius(id: 'radius_25m', length: 15),
      ],
    ),

    Geofence(
      id: 'place_4',
      latitude: 52.040336047305516,
      longitude: -0.7479872236508751,
      radius: [
        GeofenceRadius(id: 'radius_25m', length: 15),
      ],
    ),
    Geofence(
      id: 'place_5',
      latitude: 33.6183207,
      longitude: 72.9550881,
      radius: [
        GeofenceRadius(id: 'radius_25m', length: 15),
      ],
    ),
  ];

  Future<void> _onGeofenceStatusChanged(
      Geofence geofence,
      GeofenceRadius geofenceRadius,
      GeofenceStatus geofenceStatus,
      Location location) async {
    _geofenceStreamController.sink.add(geofence);
  }
  void _onLocationChanged(Location location) {
  }
  void _onLocationServicesStatusChanged(bool status) {
    print('isLocationServicesEnabled: $status');
  }
  void _onError(error) {
    final errorCode = getErrorCodesFromError(error);
    if (errorCode == null) {
      print('Undefined error: $error');
      return;
    }

    print('ErrorCode: $errorCode');
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _geofenceService.addGeofenceStatusChangeListener(_onGeofenceStatusChanged);
      _geofenceService.addLocationChangeListener(_onLocationChanged);
      _geofenceService.addLocationServicesStatusChangeListener(_onLocationServicesStatusChanged);
      _geofenceService.addStreamErrorListener(_onError);
      _geofenceService.start(_geofenceList).catchError(_onError);
    });
    _FetchDashboardData();
  }

  Widget build(BuildContext context) {
    return _buildGeofenceMonitor();
  }

  @override
  void dispose() {
    _geofenceStreamController.close();
    super.dispose();
  }

  Widget _buildGeofenceMonitor() {
    return StreamBuilder<Geofence>(
      stream: _geofenceStreamController.stream,
      builder: (context, snapshot) {
        final content = snapshot.data?.id ?? '';
        final content2 = snapshot.data?.status.name ?? '';

        return SafeArea(
          child: Scaffold(
            backgroundColor: ColorConstant.gray50,
            body: Container(
              width: double.maxFinite,
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
                          Padding(
                            padding: getPadding(
                              left: 16,
                              top: 15,
                              bottom: 43,
                            ),
                            child: Text(
                              "Hi, "+name,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtMontserratBold22,
                            ),
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
                        Padding(
                          padding: getPadding(
                            left: 16,
                          ),
                          child: Text(
                            "Last Visited Space",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSairaBold18,
                          ),
                        ),
                        Container(
                          height: getVerticalSize(
                            231,
                          ),
                          width: getHorizontalSize(
                            362,
                          ),
                          margin: getMargin(
                            left: 7,
                            top: 2,
                          ),
                          child:
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: OutlineGradientButton(
                                  padding: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      1,
                                    ),
                                    top: getVerticalSize(
                                      1,
                                    ),
                                    right: getHorizontalSize(
                                      1,
                                    ),
                                    bottom: getVerticalSize(
                                      1,
                                    ),
                                  ),
                                  strokeWidth: getHorizontalSize(
                                    1,
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment(
                                      0,
                                      0,
                                    ),
                                    end: Alignment(
                                      1,
                                      1,
                                    ),
                                    colors: [
                                      ColorConstant.whiteA700,
                                      ColorConstant.whiteA70000,
                                    ],
                                  ),
                                  corners: Corners(
                                    topLeft: Radius.circular(
                                      16,
                                    ),
                                    topRight: Radius.circular(
                                      16,
                                    ),
                                    bottomLeft: Radius.circular(
                                      16,
                                    ),
                                    bottomRight: Radius.circular(
                                      16,
                                    ),
                                  ),
                                  child: Container(
                                    height: getVerticalSize(
                                      114,
                                    ),
                                    width: getHorizontalSize(
                                      237,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorConstant.whiteA700,
                                      borderRadius: BorderRadius.circular(
                                        getHorizontalSize(
                                          16,
                                        ),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: ColorConstant.indigoA10019,
                                          spreadRadius: getHorizontalSize(
                                            2,
                                          ),
                                          blurRadius: getHorizontalSize(
                                            2,
                                          ),
                                          offset: Offset(
                                            0,
                                            15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: OutlineGradientButton(
                                  padding: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      1,
                                    ),
                                    top: getVerticalSize(
                                      1,
                                    ),
                                    right: getHorizontalSize(
                                      1,
                                    ),
                                    bottom: getVerticalSize(
                                      1,
                                    ),
                                  ),
                                  strokeWidth: getHorizontalSize(
                                    1,
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment(
                                      0,
                                      0,
                                    ),
                                    end: Alignment(
                                      1,
                                      1,
                                    ),
                                    colors: [
                                      ColorConstant.whiteA700,
                                      ColorConstant.whiteA70000,
                                    ],
                                  ),
                                  corners: Corners(
                                    topLeft: Radius.circular(
                                      16,
                                    ),
                                    topRight: Radius.circular(
                                      16,
                                    ),
                                    bottomLeft: Radius.circular(
                                      16,
                                    ),
                                    bottomRight: Radius.circular(
                                      16,
                                    ),
                                  ),
                                  child: Container(
                                    height: getVerticalSize(
                                      149,
                                    ),
                                    width: getHorizontalSize(
                                      293,
                                    ),
                                    margin: getMargin(
                                      bottom: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorConstant.whiteA700,
                                      borderRadius: BorderRadius.circular(
                                        getHorizontalSize(
                                          16,
                                        ),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: ColorConstant.indigoA10019,
                                          spreadRadius: getHorizontalSize(
                                            2,
                                          ),
                                          blurRadius: getHorizontalSize(
                                            2,
                                          ),
                                          offset: Offset(
                                            0,
                                            15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                    height: getVerticalSize(
                                      250,
                                    ),
                                    width: getHorizontalSize(
                                      362,
                                    ),
                                    // data area
                                    child: Stack(
                                      alignment: Alignment.bottomLeft,
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: getPadding(
                                              left: 10,
                                              right: 9,
                                            ),
                                            child: OutlineGradientButton(
                                              padding: EdgeInsets.only(
                                                left: getHorizontalSize(
                                                  1,
                                                ),
                                                top: getVerticalSize(
                                                  1,
                                                ),
                                                right: getHorizontalSize(
                                                  1,
                                                ),
                                                bottom: getVerticalSize(
                                                  1,
                                                ),
                                              ),
                                              strokeWidth: getHorizontalSize(
                                                1,
                                              ),
                                              gradient: LinearGradient(
                                                begin: Alignment(
                                                  0,
                                                  0,
                                                ),
                                                end: Alignment(
                                                  1,
                                                  1,
                                                ),
                                                colors: [
                                                  ColorConstant.whiteA700,
                                                  ColorConstant.whiteA70000,
                                                ],
                                              ),
                                              corners: Corners(
                                                topLeft: Radius.circular(
                                                  16,
                                                ),
                                                topRight: Radius.circular(
                                                  16,
                                                ),
                                                bottomLeft: Radius.circular(
                                                  16,
                                                ),
                                                bottomRight: Radius.circular(
                                                  16,
                                                ),
                                              ),
                                              child: Container(
                                                padding: getPadding(
                                                  left: 12,
                                                  top: 11,
                                                  right: 12,
                                                  bottom: 11,
                                                ),
                                                decoration:
                                                AppDecoration.outline.copyWith(
                                                  borderRadius: BorderRadiusStyle
                                                      .roundedBorder16,
                                                ),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding: getPadding(
                                                        left: 2,
                                                        top: 70,
                                                        bottom:70,
                                                        right: 4,
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                            children: [
                                                              // Text(
                                                              //   "No Record Found.",
                                                              //   overflow: TextOverflow
                                                              //       .ellipsis,
                                                              //   textAlign:
                                                              //   TextAlign.center,
                                                              //   style: AppStyle
                                                              //       .txtMontserratMedium14Bluegray80001,
                                                              // )

                                                              Text(
                                                                content2,
                                                                overflow: TextOverflow
                                                                    .ellipsis,
                                                                textAlign:
                                                                TextAlign.center,
                                                                style: AppStyle
                                                                    .txtMontserratMedium14Bluegray80001,
                                                              )



                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    )

                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Container(
                                            height: getSize(
                                              20,
                                            ),
                                            width: getSize(
                                              20,
                                            ),
                                            margin: getMargin(
                                              bottom: 45,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                getHorizontalSize(
                                                  10,
                                                ),
                                              ),
                                              gradient: LinearGradient(
                                                begin: Alignment(
                                                  1,
                                                  0.5,
                                                ),
                                                end: Alignment(
                                                  0,
                                                  0.5,
                                                ),
                                                colors: [
                                                  ColorConstant.gray10001,
                                                  ColorConstant.gray10002,
                                                  ColorConstant.gray50,
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            height: getSize(
                                              20,
                                            ),
                                            width: getSize(
                                              20,
                                            ),
                                            margin: getMargin(
                                              bottom: 45,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                getHorizontalSize(
                                                  10,
                                                ),
                                              ),
                                              gradient: LinearGradient(
                                                begin: Alignment(
                                                  1,
                                                  0.5,
                                                ),
                                                end: Alignment(
                                                  0,
                                                  0.5,
                                                ),
                                                colors: [
                                                  ColorConstant.gray10003,
                                                  ColorConstant.gray50,
                                                  ColorConstant.gray10001,
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                   // child: is_visited ?
                                    // Stack(
                                    //   alignment: Alignment.bottomLeft,
                                    //   children: [
                                    //     Align(
                                    //       alignment: Alignment.center,
                                    //       child: Padding(
                                    //         padding: getPadding(
                                    //           left: 10,
                                    //           right: 9,
                                    //         ),
                                    //         child: OutlineGradientButton(
                                    //           padding: EdgeInsets.only(
                                    //             left: getHorizontalSize(
                                    //               1,
                                    //             ),
                                    //             top: getVerticalSize(
                                    //               1,
                                    //             ),
                                    //             right: getHorizontalSize(
                                    //               1,
                                    //             ),
                                    //             bottom: getVerticalSize(
                                    //               1,
                                    //             ),
                                    //           ),
                                    //           strokeWidth: getHorizontalSize(
                                    //             1,
                                    //           ),
                                    //           gradient: LinearGradient(
                                    //             begin: Alignment(
                                    //               0,
                                    //               0,
                                    //             ),
                                    //             end: Alignment(
                                    //               1,
                                    //               1,
                                    //             ),
                                    //             colors: [
                                    //               ColorConstant.whiteA700,
                                    //               ColorConstant.whiteA70000,
                                    //             ],
                                    //           ),
                                    //           corners: Corners(
                                    //             topLeft: Radius.circular(
                                    //               16,
                                    //             ),
                                    //             topRight: Radius.circular(
                                    //               16,
                                    //             ),
                                    //             bottomLeft: Radius.circular(
                                    //               16,
                                    //             ),
                                    //             bottomRight: Radius.circular(
                                    //               16,
                                    //             ),
                                    //           ),
                                    //           child: Container(
                                    //             padding: getPadding(
                                    //               left: 12,
                                    //               top: 11,
                                    //               right: 12,
                                    //               bottom: 11,
                                    //             ),
                                    //             decoration:
                                    //             AppDecoration.outline.copyWith(
                                    //               borderRadius: BorderRadiusStyle
                                    //                   .roundedBorder16,
                                    //             ),
                                    //             child: Column(
                                    //               mainAxisSize: MainAxisSize.min,
                                    //               mainAxisAlignment:
                                    //               MainAxisAlignment.end,
                                    //               children: [
                                    //                 Padding(
                                    //                   padding: getPadding(
                                    //                     left: 2,
                                    //                     top: 12,
                                    //                     right: 4,
                                    //                   ),
                                    //                   child: Row(
                                    //                     mainAxisAlignment:
                                    //                     MainAxisAlignment
                                    //                         .spaceBetween,
                                    //                     children: [
                                    //                       Column(
                                    //                         crossAxisAlignment:
                                    //                         CrossAxisAlignment
                                    //                             .start,
                                    //                         mainAxisAlignment:
                                    //                         MainAxisAlignment
                                    //                             .start,
                                    //                         children: [
                                    //                           Text(
                                    //                             _address,
                                    //                             overflow: TextOverflow
                                    //                                 .ellipsis,
                                    //                             textAlign:
                                    //                             TextAlign.left,
                                    //                             style: AppStyle
                                    //                                 .txtMontserratMedium14Bluegray80001,
                                    //                           )
                                    //                         ],
                                    //                       ),
                                    //                       CustomIconButton(
                                    //                         height: 40,
                                    //                         width: 40,
                                    //                         margin: getMargin(
                                    //                           bottom: 1,
                                    //                         ),
                                    //                         variant: IconButtonVariant
                                    //                             .OutlineBlack9000f,
                                    //                         child: CustomImageView(
                                    //                           svgPath: ImageConstant
                                    //                               .imgQrcode,
                                    //                         ),
                                    //                       ),
                                    //                     ],
                                    //                   ),
                                    //                 ),
                                    //                 Padding(
                                    //                   padding: getPadding(
                                    //                     top: 22,
                                    //                     right: 4,
                                    //                   ),
                                    //                   child: Row(
                                    //                     mainAxisAlignment:
                                    //                     MainAxisAlignment
                                    //                         .spaceBetween,
                                    //                     children: [
                                    //                       Text(
                                    //                         ''+_latitude.toString(),
                                    //                         overflow:
                                    //                         TextOverflow.ellipsis,
                                    //                         textAlign: TextAlign.left,
                                    //                         style: AppStyle
                                    //                             .txtMontserratMedium18,
                                    //                       ),
                                    //                       CustomImageView(
                                    //                         svgPath: ImageConstant
                                    //                             .imgGroup159,
                                    //                         height: getVerticalSize(
                                    //                           8,
                                    //                         ),
                                    //                         width: getHorizontalSize(
                                    //                           117,
                                    //                         ),
                                    //                         margin: getMargin(
                                    //                           top: 7,
                                    //                           bottom: 6,
                                    //                         ),
                                    //                       ),
                                    //                       Text(
                                    //                         ''+_longitude.toString(),
                                    //                         overflow:
                                    //                         TextOverflow.ellipsis,
                                    //                         textAlign: TextAlign.left,
                                    //                         style: AppStyle
                                    //                             .txtMontserratMedium18,
                                    //                       ),
                                    //                     ],
                                    //                   ),
                                    //                 ),
                                    //                 Padding(
                                    //                   padding: getPadding(
                                    //                     top: 18,
                                    //                     right: 4,
                                    //                     bottom: 18,
                                    //                   ),
                                    //                   child: Row(
                                    //                     mainAxisAlignment:
                                    //                     MainAxisAlignment
                                    //                         .spaceBetween,
                                    //                     children: [
                                    //                       Text(
                                    //                         "30 Apr, 2023",
                                    //                         overflow:
                                    //                         TextOverflow.ellipsis,
                                    //                         textAlign: TextAlign.left,
                                    //                         style: AppStyle
                                    //                             .txtMontserratMedium14Bluegray30003,
                                    //                       ),
                                    //                       Text(
                                    //                         "30 Apr, 2023",
                                    //                         overflow:
                                    //                         TextOverflow.ellipsis,
                                    //                         textAlign: TextAlign.left,
                                    //                         style: AppStyle
                                    //                             .txtMontserratMedium14Bluegray30003,
                                    //                       ),
                                    //                     ],
                                    //                   ),
                                    //                 ),
                                    //
                                    //               ],
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //     Align(
                                    //       alignment: Alignment.bottomLeft,
                                    //       child: Container(
                                    //         height: getSize(
                                    //           20,
                                    //         ),
                                    //         width: getSize(
                                    //           20,
                                    //         ),
                                    //         margin: getMargin(
                                    //           bottom: 45,
                                    //         ),
                                    //         decoration: BoxDecoration(
                                    //           borderRadius: BorderRadius.circular(
                                    //             getHorizontalSize(
                                    //               10,
                                    //             ),
                                    //           ),
                                    //           gradient: LinearGradient(
                                    //             begin: Alignment(
                                    //               1,
                                    //               0.5,
                                    //             ),
                                    //             end: Alignment(
                                    //               0,
                                    //               0.5,
                                    //             ),
                                    //             colors: [
                                    //               ColorConstant.gray10001,
                                    //               ColorConstant.gray10002,
                                    //               ColorConstant.gray50,
                                    //             ],
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //     Align(
                                    //       alignment: Alignment.bottomRight,
                                    //       child: Container(
                                    //         height: getSize(
                                    //           20,
                                    //         ),
                                    //         width: getSize(
                                    //           20,
                                    //         ),
                                    //         margin: getMargin(
                                    //           bottom: 45,
                                    //         ),
                                    //         decoration: BoxDecoration(
                                    //           borderRadius: BorderRadius.circular(
                                    //             getHorizontalSize(
                                    //               10,
                                    //             ),
                                    //           ),
                                    //           gradient: LinearGradient(
                                    //             begin: Alignment(
                                    //               1,
                                    //               0.5,
                                    //             ),
                                    //             end: Alignment(
                                    //               0,
                                    //               0.5,
                                    //             ),
                                    //             colors: [
                                    //               ColorConstant.gray10003,
                                    //               ColorConstant.gray50,
                                    //               ColorConstant.gray10001,
                                    //             ],
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ) : Stack(
                                    //   alignment: Alignment.bottomLeft,
                                    //   children: [
                                    //     Align(
                                    //       alignment: Alignment.center,
                                    //       child: Padding(
                                    //         padding: getPadding(
                                    //           left: 10,
                                    //           right: 9,
                                    //         ),
                                    //         child: OutlineGradientButton(
                                    //           padding: EdgeInsets.only(
                                    //             left: getHorizontalSize(
                                    //               1,
                                    //             ),
                                    //             top: getVerticalSize(
                                    //               1,
                                    //             ),
                                    //             right: getHorizontalSize(
                                    //               1,
                                    //             ),
                                    //             bottom: getVerticalSize(
                                    //               1,
                                    //             ),
                                    //           ),
                                    //           strokeWidth: getHorizontalSize(
                                    //             1,
                                    //           ),
                                    //           gradient: LinearGradient(
                                    //             begin: Alignment(
                                    //               0,
                                    //               0,
                                    //             ),
                                    //             end: Alignment(
                                    //               1,
                                    //               1,
                                    //             ),
                                    //             colors: [
                                    //               ColorConstant.whiteA700,
                                    //               ColorConstant.whiteA70000,
                                    //             ],
                                    //           ),
                                    //           corners: Corners(
                                    //             topLeft: Radius.circular(
                                    //               16,
                                    //             ),
                                    //             topRight: Radius.circular(
                                    //               16,
                                    //             ),
                                    //             bottomLeft: Radius.circular(
                                    //               16,
                                    //             ),
                                    //             bottomRight: Radius.circular(
                                    //               16,
                                    //             ),
                                    //           ),
                                    //           child: Container(
                                    //             padding: getPadding(
                                    //               left: 12,
                                    //               top: 11,
                                    //               right: 12,
                                    //               bottom: 11,
                                    //             ),
                                    //             decoration:
                                    //             AppDecoration.outline.copyWith(
                                    //               borderRadius: BorderRadiusStyle
                                    //                   .roundedBorder16,
                                    //             ),
                                    //             child: Column(
                                    //               mainAxisSize: MainAxisSize.min,
                                    //               mainAxisAlignment:
                                    //               MainAxisAlignment.center,
                                    //               children: [
                                    //                 Padding(
                                    //                   padding: getPadding(
                                    //                     left: 2,
                                    //                     top: 70,
                                    //                     bottom:70,
                                    //                     right: 4,
                                    //                   ),
                                    //                   child: Row(
                                    //                     mainAxisAlignment:
                                    //                     MainAxisAlignment
                                    //                         .center,
                                    //                     children: [
                                    //                       Column(
                                    //                         crossAxisAlignment:
                                    //                         CrossAxisAlignment
                                    //                             .center,
                                    //                         mainAxisAlignment:
                                    //                         MainAxisAlignment
                                    //                             .center,
                                    //                         children: [
                                    //                           // Text(
                                    //                           //   "No Record Found.",
                                    //                           //   overflow: TextOverflow
                                    //                           //       .ellipsis,
                                    //                           //   textAlign:
                                    //                           //   TextAlign.center,
                                    //                           //   style: AppStyle
                                    //                           //       .txtMontserratMedium14Bluegray80001,
                                    //                           // )
                                    //
                                    //                           Text(
                                    //                             content2,
                                    //                             overflow: TextOverflow
                                    //                                 .ellipsis,
                                    //                             textAlign:
                                    //                             TextAlign.center,
                                    //                             style: AppStyle
                                    //                                 .txtMontserratMedium14Bluegray80001,
                                    //                           )
                                    //
                                    //
                                    //
                                    //                         ],
                                    //                       )
                                    //                     ],
                                    //                   ),
                                    //                 )
                                    //
                                    //               ],
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //     Align(
                                    //       alignment: Alignment.bottomLeft,
                                    //       child: Container(
                                    //         height: getSize(
                                    //           20,
                                    //         ),
                                    //         width: getSize(
                                    //           20,
                                    //         ),
                                    //         margin: getMargin(
                                    //           bottom: 45,
                                    //         ),
                                    //         decoration: BoxDecoration(
                                    //           borderRadius: BorderRadius.circular(
                                    //             getHorizontalSize(
                                    //               10,
                                    //             ),
                                    //           ),
                                    //           gradient: LinearGradient(
                                    //             begin: Alignment(
                                    //               1,
                                    //               0.5,
                                    //             ),
                                    //             end: Alignment(
                                    //               0,
                                    //               0.5,
                                    //             ),
                                    //             colors: [
                                    //               ColorConstant.gray10001,
                                    //               ColorConstant.gray10002,
                                    //               ColorConstant.gray50,
                                    //             ],
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //     Align(
                                    //       alignment: Alignment.bottomRight,
                                    //       child: Container(
                                    //         height: getSize(
                                    //           20,
                                    //         ),
                                    //         width: getSize(
                                    //           20,
                                    //         ),
                                    //         margin: getMargin(
                                    //           bottom: 45,
                                    //         ),
                                    //         decoration: BoxDecoration(
                                    //           borderRadius: BorderRadius.circular(
                                    //             getHorizontalSize(
                                    //               10,
                                    //             ),
                                    //           ),
                                    //           gradient: LinearGradient(
                                    //             begin: Alignment(
                                    //               1,
                                    //               0.5,
                                    //             ),
                                    //             end: Alignment(
                                    //               0,
                                    //               0.5,
                                    //             ),
                                    //             colors: [
                                    //               ColorConstant.gray10003,
                                    //               ColorConstant.gray50,
                                    //               ColorConstant.gray10001,
                                    //             ],
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // )child: is_visited ?
                                    // Stack(
                                    //   alignment: Alignment.bottomLeft,
                                    //   children: [
                                    //     Align(
                                    //       alignment: Alignment.center,
                                    //       child: Padding(
                                    //         padding: getPadding(
                                    //           left: 10,
                                    //           right: 9,
                                    //         ),
                                    //         child: OutlineGradientButton(
                                    //           padding: EdgeInsets.only(
                                    //             left: getHorizontalSize(
                                    //               1,
                                    //             ),
                                    //             top: getVerticalSize(
                                    //               1,
                                    //             ),
                                    //             right: getHorizontalSize(
                                    //               1,
                                    //             ),
                                    //             bottom: getVerticalSize(
                                    //               1,
                                    //             ),
                                    //           ),
                                    //           strokeWidth: getHorizontalSize(
                                    //             1,
                                    //           ),
                                    //           gradient: LinearGradient(
                                    //             begin: Alignment(
                                    //               0,
                                    //               0,
                                    //             ),
                                    //             end: Alignment(
                                    //               1,
                                    //               1,
                                    //             ),
                                    //             colors: [
                                    //               ColorConstant.whiteA700,
                                    //               ColorConstant.whiteA70000,
                                    //             ],
                                    //           ),
                                    //           corners: Corners(
                                    //             topLeft: Radius.circular(
                                    //               16,
                                    //             ),
                                    //             topRight: Radius.circular(
                                    //               16,
                                    //             ),
                                    //             bottomLeft: Radius.circular(
                                    //               16,
                                    //             ),
                                    //             bottomRight: Radius.circular(
                                    //               16,
                                    //             ),
                                    //           ),
                                    //           child: Container(
                                    //             padding: getPadding(
                                    //               left: 12,
                                    //               top: 11,
                                    //               right: 12,
                                    //               bottom: 11,
                                    //             ),
                                    //             decoration:
                                    //             AppDecoration.outline.copyWith(
                                    //               borderRadius: BorderRadiusStyle
                                    //                   .roundedBorder16,
                                    //             ),
                                    //             child: Column(
                                    //               mainAxisSize: MainAxisSize.min,
                                    //               mainAxisAlignment:
                                    //               MainAxisAlignment.end,
                                    //               children: [
                                    //                 Padding(
                                    //                   padding: getPadding(
                                    //                     left: 2,
                                    //                     top: 12,
                                    //                     right: 4,
                                    //                   ),
                                    //                   child: Row(
                                    //                     mainAxisAlignment:
                                    //                     MainAxisAlignment
                                    //                         .spaceBetween,
                                    //                     children: [
                                    //                       Column(
                                    //                         crossAxisAlignment:
                                    //                         CrossAxisAlignment
                                    //                             .start,
                                    //                         mainAxisAlignment:
                                    //                         MainAxisAlignment
                                    //                             .start,
                                    //                         children: [
                                    //                           Text(
                                    //                             _address,
                                    //                             overflow: TextOverflow
                                    //                                 .ellipsis,
                                    //                             textAlign:
                                    //                             TextAlign.left,
                                    //                             style: AppStyle
                                    //                                 .txtMontserratMedium14Bluegray80001,
                                    //                           )
                                    //                         ],
                                    //                       ),
                                    //                       CustomIconButton(
                                    //                         height: 40,
                                    //                         width: 40,
                                    //                         margin: getMargin(
                                    //                           bottom: 1,
                                    //                         ),
                                    //                         variant: IconButtonVariant
                                    //                             .OutlineBlack9000f,
                                    //                         child: CustomImageView(
                                    //                           svgPath: ImageConstant
                                    //                               .imgQrcode,
                                    //                         ),
                                    //                       ),
                                    //                     ],
                                    //                   ),
                                    //                 ),
                                    //                 Padding(
                                    //                   padding: getPadding(
                                    //                     top: 22,
                                    //                     right: 4,
                                    //                   ),
                                    //                   child: Row(
                                    //                     mainAxisAlignment:
                                    //                     MainAxisAlignment
                                    //                         .spaceBetween,
                                    //                     children: [
                                    //                       Text(
                                    //                         ''+_latitude.toString(),
                                    //                         overflow:
                                    //                         TextOverflow.ellipsis,
                                    //                         textAlign: TextAlign.left,
                                    //                         style: AppStyle
                                    //                             .txtMontserratMedium18,
                                    //                       ),
                                    //                       CustomImageView(
                                    //                         svgPath: ImageConstant
                                    //                             .imgGroup159,
                                    //                         height: getVerticalSize(
                                    //                           8,
                                    //                         ),
                                    //                         width: getHorizontalSize(
                                    //                           117,
                                    //                         ),
                                    //                         margin: getMargin(
                                    //                           top: 7,
                                    //                           bottom: 6,
                                    //                         ),
                                    //                       ),
                                    //                       Text(
                                    //                         ''+_longitude.toString(),
                                    //                         overflow:
                                    //                         TextOverflow.ellipsis,
                                    //                         textAlign: TextAlign.left,
                                    //                         style: AppStyle
                                    //                             .txtMontserratMedium18,
                                    //                       ),
                                    //                     ],
                                    //                   ),
                                    //                 ),
                                    //                 Padding(
                                    //                   padding: getPadding(
                                    //                     top: 18,
                                    //                     right: 4,
                                    //                     bottom: 18,
                                    //                   ),
                                    //                   child: Row(
                                    //                     mainAxisAlignment:
                                    //                     MainAxisAlignment
                                    //                         .spaceBetween,
                                    //                     children: [
                                    //                       Text(
                                    //                         "30 Apr, 2023",
                                    //                         overflow:
                                    //                         TextOverflow.ellipsis,
                                    //                         textAlign: TextAlign.left,
                                    //                         style: AppStyle
                                    //                             .txtMontserratMedium14Bluegray30003,
                                    //                       ),
                                    //                       Text(
                                    //                         "30 Apr, 2023",
                                    //                         overflow:
                                    //                         TextOverflow.ellipsis,
                                    //                         textAlign: TextAlign.left,
                                    //                         style: AppStyle
                                    //                             .txtMontserratMedium14Bluegray30003,
                                    //                       ),
                                    //                     ],
                                    //                   ),
                                    //                 ),
                                    //
                                    //               ],
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //     Align(
                                    //       alignment: Alignment.bottomLeft,
                                    //       child: Container(
                                    //         height: getSize(
                                    //           20,
                                    //         ),
                                    //         width: getSize(
                                    //           20,
                                    //         ),
                                    //         margin: getMargin(
                                    //           bottom: 45,
                                    //         ),
                                    //         decoration: BoxDecoration(
                                    //           borderRadius: BorderRadius.circular(
                                    //             getHorizontalSize(
                                    //               10,
                                    //             ),
                                    //           ),
                                    //           gradient: LinearGradient(
                                    //             begin: Alignment(
                                    //               1,
                                    //               0.5,
                                    //             ),
                                    //             end: Alignment(
                                    //               0,
                                    //               0.5,
                                    //             ),
                                    //             colors: [
                                    //               ColorConstant.gray10001,
                                    //               ColorConstant.gray10002,
                                    //               ColorConstant.gray50,
                                    //             ],
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //     Align(
                                    //       alignment: Alignment.bottomRight,
                                    //       child: Container(
                                    //         height: getSize(
                                    //           20,
                                    //         ),
                                    //         width: getSize(
                                    //           20,
                                    //         ),
                                    //         margin: getMargin(
                                    //           bottom: 45,
                                    //         ),
                                    //         decoration: BoxDecoration(
                                    //           borderRadius: BorderRadius.circular(
                                    //             getHorizontalSize(
                                    //               10,
                                    //             ),
                                    //           ),
                                    //           gradient: LinearGradient(
                                    //             begin: Alignment(
                                    //               1,
                                    //               0.5,
                                    //             ),
                                    //             end: Alignment(
                                    //               0,
                                    //               0.5,
                                    //             ),
                                    //             colors: [
                                    //               ColorConstant.gray10003,
                                    //               ColorConstant.gray50,
                                    //               ColorConstant.gray10001,
                                    //             ],
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ) : Stack(
                                    //   alignment: Alignment.bottomLeft,
                                    //   children: [
                                    //     Align(
                                    //       alignment: Alignment.center,
                                    //       child: Padding(
                                    //         padding: getPadding(
                                    //           left: 10,
                                    //           right: 9,
                                    //         ),
                                    //         child: OutlineGradientButton(
                                    //           padding: EdgeInsets.only(
                                    //             left: getHorizontalSize(
                                    //               1,
                                    //             ),
                                    //             top: getVerticalSize(
                                    //               1,
                                    //             ),
                                    //             right: getHorizontalSize(
                                    //               1,
                                    //             ),
                                    //             bottom: getVerticalSize(
                                    //               1,
                                    //             ),
                                    //           ),
                                    //           strokeWidth: getHorizontalSize(
                                    //             1,
                                    //           ),
                                    //           gradient: LinearGradient(
                                    //             begin: Alignment(
                                    //               0,
                                    //               0,
                                    //             ),
                                    //             end: Alignment(
                                    //               1,
                                    //               1,
                                    //             ),
                                    //             colors: [
                                    //               ColorConstant.whiteA700,
                                    //               ColorConstant.whiteA70000,
                                    //             ],
                                    //           ),
                                    //           corners: Corners(
                                    //             topLeft: Radius.circular(
                                    //               16,
                                    //             ),
                                    //             topRight: Radius.circular(
                                    //               16,
                                    //             ),
                                    //             bottomLeft: Radius.circular(
                                    //               16,
                                    //             ),
                                    //             bottomRight: Radius.circular(
                                    //               16,
                                    //             ),
                                    //           ),
                                    //           child: Container(
                                    //             padding: getPadding(
                                    //               left: 12,
                                    //               top: 11,
                                    //               right: 12,
                                    //               bottom: 11,
                                    //             ),
                                    //             decoration:
                                    //             AppDecoration.outline.copyWith(
                                    //               borderRadius: BorderRadiusStyle
                                    //                   .roundedBorder16,
                                    //             ),
                                    //             child: Column(
                                    //               mainAxisSize: MainAxisSize.min,
                                    //               mainAxisAlignment:
                                    //               MainAxisAlignment.center,
                                    //               children: [
                                    //                 Padding(
                                    //                   padding: getPadding(
                                    //                     left: 2,
                                    //                     top: 70,
                                    //                     bottom:70,
                                    //                     right: 4,
                                    //                   ),
                                    //                   child: Row(
                                    //                     mainAxisAlignment:
                                    //                     MainAxisAlignment
                                    //                         .center,
                                    //                     children: [
                                    //                       Column(
                                    //                         crossAxisAlignment:
                                    //                         CrossAxisAlignment
                                    //                             .center,
                                    //                         mainAxisAlignment:
                                    //                         MainAxisAlignment
                                    //                             .center,
                                    //                         children: [
                                    //                           // Text(
                                    //                           //   "No Record Found.",
                                    //                           //   overflow: TextOverflow
                                    //                           //       .ellipsis,
                                    //                           //   textAlign:
                                    //                           //   TextAlign.center,
                                    //                           //   style: AppStyle
                                    //                           //       .txtMontserratMedium14Bluegray80001,
                                    //                           // )
                                    //
                                    //                           Text(
                                    //                             content2,
                                    //                             overflow: TextOverflow
                                    //                                 .ellipsis,
                                    //                             textAlign:
                                    //                             TextAlign.center,
                                    //                             style: AppStyle
                                    //                                 .txtMontserratMedium14Bluegray80001,
                                    //                           )
                                    //
                                    //
                                    //
                                    //                         ],
                                    //                       )
                                    //                     ],
                                    //                   ),
                                    //                 )
                                    //
                                    //               ],
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //     Align(
                                    //       alignment: Alignment.bottomLeft,
                                    //       child: Container(
                                    //         height: getSize(
                                    //           20,
                                    //         ),
                                    //         width: getSize(
                                    //           20,
                                    //         ),
                                    //         margin: getMargin(
                                    //           bottom: 45,
                                    //         ),
                                    //         decoration: BoxDecoration(
                                    //           borderRadius: BorderRadius.circular(
                                    //             getHorizontalSize(
                                    //               10,
                                    //             ),
                                    //           ),
                                    //           gradient: LinearGradient(
                                    //             begin: Alignment(
                                    //               1,
                                    //               0.5,
                                    //             ),
                                    //             end: Alignment(
                                    //               0,
                                    //               0.5,
                                    //             ),
                                    //             colors: [
                                    //               ColorConstant.gray10001,
                                    //               ColorConstant.gray10002,
                                    //               ColorConstant.gray50,
                                    //             ],
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //     Align(
                                    //       alignment: Alignment.bottomRight,
                                    //       child: Container(
                                    //         height: getSize(
                                    //           20,
                                    //         ),
                                    //         width: getSize(
                                    //           20,
                                    //         ),
                                    //         margin: getMargin(
                                    //           bottom: 45,
                                    //         ),
                                    //         decoration: BoxDecoration(
                                    //           borderRadius: BorderRadius.circular(
                                    //             getHorizontalSize(
                                    //               10,
                                    //             ),
                                    //           ),
                                    //           gradient: LinearGradient(
                                    //             begin: Alignment(
                                    //               1,
                                    //               0.5,
                                    //             ),
                                    //             end: Alignment(
                                    //               0,
                                    //               0.5,
                                    //             ),
                                    //             colors: [
                                    //               ColorConstant.gray10003,
                                    //               ColorConstant.gray50,
                                    //               ColorConstant.gray10001,
                                    //             ],
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // )
                                ),
                              ),
                            ],
                          ),
                        ),

                        // bottom area
                        Container(
                          height: getVerticalSize(
                            220,
                          ),
                          width: getHorizontalSize(
                            359,
                          ),
                          margin: getMargin(
                            left: 16,
                            top: 71,
                            bottom: 5,
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Parking Space",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtSairaBold18,
                                    ),
                                    Container(
                                        height: getVerticalSize(
                                          150,
                                        ),
                                        child: ListView.separated(
                                          padding: getPadding(
                                            top: 12,
                                          ),
                                          scrollDirection: Axis.horizontal,
                                          separatorBuilder: (context, index) {
                                            return SizedBox(
                                              height: getVerticalSize(
                                                16,
                                              ),
                                            );
                                          },
                                          itemCount: parking.length,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                // showDialog(
                                                //   context: context,
                                                //   builder: (context) {
                                                //     return MapAlertDialog();
                                                //   },
                                                // );
                                              },
                                              child: ListsetpickuppoItemWidget(
                                                title: parking[index]['name'],
                                                location: parking[index]['address'],
                                                latitude: parking[index]['latitude'],
                                                longitude: parking[index]['longitude'],
                                              ),
                                            );
                                          },
                                        )
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


  void _FetchDashboardData() async {

    User? user = auth.currentUser;
    if (user != null) {
      String uid = user.uid;
      print('Current user UID: $uid');
      try {
        FirebaseDatabase database = FirebaseDatabase.instance;
        DatabaseReference reference = database.reference().child('users').child(uid);

        reference.onValue.listen((event) {
          DataSnapshot snapshot = event.snapshot;
          if (snapshot.value != null) {
            Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;

            name = data['name'];
            bool isVisitedParking = data['isVisited_Parking'];
            is_visited = isVisitedParking;
            if(is_visited){
              String address = data['address'];
              double latitude = data['latitude'].toDouble();
              double longitude = data['longitude'].toDouble();
              _address = address;
              _latitude = latitude;
              _longitude = longitude;
              is_visited = true;

            }else{
              is_visited = isVisitedParking;
            }

          } else {
            // Handle the case where the snapshot value is null or doesn't exist
            print('No data available');
          }
        }, onError: (error) {
          // Handle any errors that may occur while listening for changes
          print('Error: $error');
        });

        DatabaseReference parkingRef =
        database.reference().child('parking_locations');

        // Retrieve parking locations from Firebase Realtime Database
        parkingRef.onValue.listen((event) async {
          Map<dynamic, dynamic> parkingsMap = event.snapshot.value as Map<dynamic, dynamic>;
          if (parkingsMap != null) {
            List<Map<String, dynamic>> tempParking = [];
            parkingsMap.forEach((key, value) {
              Map<String, dynamic> parking = Map.from(value);

              tempParking.add({
                'name': parking['name'].toString(),
                'address': parking['address'].toString(),
                'latitude': parking['latitude'].toString(),
                'longitude': parking['longitude'].toString(),
                // add other properties as needed
              });

            });

            setState(() {
              parking = tempParking;
              _FetchDashboardData();
            });
          }
        });

      } catch (error) {
        print(error);
      }
    } else {
      print('User is not authenticated.');
    }

    /*geofancing code*/

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _geofenceService.addGeofenceStatusChangeListener(_onGeofenceStatusChanged);
      _geofenceService.addLocationChangeListener(_onLocationChanged);
      _geofenceService.addLocationServicesStatusChangeListener(_onLocationServicesStatusChanged);
      _geofenceService.addStreamErrorListener(_onError);
      _geofenceService.start(_geofenceList).catchError(_onError);
    });

    /*geofancing code*/

  }


  void _Update_DashboardData() async {
    User? user = auth.currentUser;
    if (user != null) {
      String uid = user.uid;
      print('Current user UID: $uid');
      try {
        FirebaseDatabase database = FirebaseDatabase.instance;
        DatabaseReference reference = database.reference().child('users').child(uid);

        reference.update({
          'address': '123 Main St',
          'latitude': 32.7749,
          'isVisited_Parking': false,
          'longitude': 72.4194,
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


