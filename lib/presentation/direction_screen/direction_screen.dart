import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:parking_assistant/core/app_export.dart';
import 'package:parking_assistant/widgets/app_bar/appbar_iconbutton.dart';
import 'package:parking_assistant/widgets/app_bar/appbar_image.dart';
import 'package:parking_assistant/widgets/app_bar/appbar_title.dart';
import 'package:parking_assistant/widgets/app_bar/custom_app_bar.dart';
import 'package:parking_assistant/widgets/custom_icon_button.dart';

class DirectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                height: size.height,
                width: double.maxFinite,
                decoration: AppDecoration.fillGray5001,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 0,
                        margin: EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusStyle.roundedBorder24,
                        ),
                        child: Container(
                          height: getVerticalSize(
                            726,
                          ),
                          width: double.maxFinite,
                          decoration: AppDecoration.gradientBlue7004fWhiteA70000
                              .copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder24,
                          ),
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgMaps,
                                height: getVerticalSize(
                                  726,
                                ),
                                width: getHorizontalSize(
                                  375,
                                ),
                                radius: BorderRadius.circular(
                                  getHorizontalSize(
                                    24,
                                  ),
                                ),
                                alignment: Alignment.center,
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: getPadding(
                                    left: 20,
                                    top: 36,
                                    right: 20,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: getPadding(
                                          left: 15,
                                          top: 12,
                                          right: 15,
                                          bottom: 12,
                                        ),
                                        decoration: AppDecoration
                                            .outlineGray70026
                                            .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder6,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: getPadding(
                                                top: 4,
                                              ),
                                              child: Text(
                                                "Where to park?",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtMontserratBold14,
                                              ),
                                            ),
                                            CustomImageView(
                                              svgPath: ImageConstant.imgSearch,
                                              height: getSize(
                                                16,
                                              ),
                                              width: getSize(
                                                16,
                                              ),
                                              margin: getMargin(
                                                top: 4,
                                                right: 1,
                                                bottom: 2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: getMargin(
                                          left: 21,
                                          top: 92,
                                        ),
                                        padding: getPadding(
                                          left: 15,
                                          top: 12,
                                          right: 15,
                                          bottom: 12,
                                        ),
                                        decoration: AppDecoration
                                            .outlineBlack90019
                                            .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder3,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: getPadding(
                                                bottom: 1,
                                              ),
                                              child: Text(
                                                "Arrival",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtMontserratRegular12,
                                              ),
                                            ),
                                            Padding(
                                              padding: getPadding(
                                                left: 8,
                                              ),
                                              child: Text(
                                                "1.7km ( 2 mins )",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtMontserratBold12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: getPadding(
                                            left: 47,
                                            top: 9,
                                            right: 50,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomIconButton(
                                                height: 48,
                                                width: 48,
                                                margin: getMargin(
                                                  bottom: 157,
                                                ),
                                                variant: IconButtonVariant
                                                    .OutlineGray70019,
                                                shape: IconButtonShape
                                                    .CircleBorder24,
                                                padding: IconButtonPadding
                                                    .PaddingAll15,
                                                child: CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgLocation,
                                                ),
                                              ),
                                              Container(
                                                height: getVerticalSize(
                                                  184,
                                                ),
                                                width: getHorizontalSize(
                                                  189,
                                                ),
                                                margin: getMargin(
                                                  top: 21,
                                                ),
                                                child: Stack(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  children: [
                                                    CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgGroup6group,
                                                      height: getVerticalSize(
                                                        150,
                                                      ),
                                                      width: getHorizontalSize(
                                                        151,
                                                      ),
                                                      radius:
                                                          BorderRadius.circular(
                                                        getHorizontalSize(
                                                          20,
                                                        ),
                                                      ),
                                                      alignment:
                                                          Alignment.topLeft,
                                                    ),
                                                    CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgVolume,
                                                      height: getSize(
                                                        76,
                                                      ),
                                                      width: getSize(
                                                        76,
                                                      ),
                                                      alignment:
                                                          Alignment.bottomRight,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      CustomIconButton(
                                        height: 56,
                                        width: 56,
                                        margin: getMargin(
                                          top: 29,
                                          right: 1,
                                        ),
                                        variant:
                                            IconButtonVariant.OutlineGray70033,
                                        shape: IconButtonShape.CircleBorder28,
                                        padding: IconButtonPadding.PaddingAll19,
                                        alignment: Alignment.centerRight,
                                        child: CustomImageView(
                                          svgPath: ImageConstant.imgSend,
                                        ),
                                      ),
                                      Container(
                                        margin: getMargin(
                                          left: 4,
                                          top: 24,
                                          right: 4,
                                        ),
                                        decoration:
                                            AppDecoration.outline.copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder16,
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
                                          child: Padding(
                                            padding: getPadding(
                                              left: 8,
                                              top: 5,
                                              right: 8,
                                              bottom: 5,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: getPadding(
                                                    left: 3,
                                                    top: 9,
                                                    bottom: 11,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "Opal Tower",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtRobotoMedium12,
                                                      ),
                                                      Padding(
                                                        padding: getPadding(
                                                          top: 5,
                                                        ),
                                                        child: Text(
                                                          "On Spot Parking",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtRobotoMedium18,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: getPadding(
                                                          top: 12,
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            CustomImageView(
                                                              svgPath:
                                                                  ImageConstant
                                                                      .imgCar,
                                                              height:
                                                                  getVerticalSize(
                                                                16,
                                                              ),
                                                              width:
                                                                  getHorizontalSize(
                                                                18,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  getPadding(
                                                                left: 8,
                                                              ),
                                                              child: Text(
                                                                "15 Car Spots",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtRobotoMedium12,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: getMargin(
                                                    top: 1,
                                                  ),
                                                  padding: getPadding(
                                                    left: 10,
                                                    top: 19,
                                                    right: 10,
                                                    bottom: 19,
                                                  ),
                                                  decoration: AppDecoration
                                                      .fillIndigo50
                                                      .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder16,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding: getPadding(
                                                          top: 2,
                                                        ),
                                                        child: Text(
                                                          "A03 (Base 2)",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtMontserratMedium16,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: getPadding(
                                                          top: 12,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            CustomImageView(
                                                              svgPath:
                                                                  ImageConstant
                                                                      .imgPointer1,
                                                              height: getSize(
                                                                16,
                                                              ),
                                                              width: getSize(
                                                                16,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  getPadding(
                                                                left: 7,
                                                                top: 1,
                                                              ),
                                                              child: Text(
                                                                "1.3 km away",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtRobotoMedium12Gray700,
                                                              ),
                                                            ),
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
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    CustomAppBar(
                      height: getVerticalSize(
                        58,
                      ),
                      leadingWidth: 48,
                      leading: AppbarIconbutton(
                        svgPath: ImageConstant.imgMenu,
                        margin: getMargin(
                          left: 16,
                          top: 9,
                          bottom: 17,
                        ),
                      ),
                      centerTitle: true,
                      title: AppbarTitle(
                        text: "Map",
                      ),
                      actions: [
                        Container(
                          margin: getMargin(
                            left: 16,
                            top: 9,
                            right: 16,
                            bottom: 17,
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
                      styleType: Style.bgShadowIndigoA20033,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
