import '../home_one_screen/widgets/listdirectionsc_item_widget.dart';
import '../home_one_screen/widgets/listsetpickuppo_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:parking_assistant/core/app_export.dart';
import 'package:parking_assistant/widgets/app_bar/appbar_iconbutton.dart';
import 'package:parking_assistant/widgets/app_bar/appbar_image.dart';
import 'package:parking_assistant/widgets/app_bar/appbar_title.dart';
import 'package:parking_assistant/widgets/app_bar/custom_app_bar.dart';
import 'package:parking_assistant/widgets/custom_icon_button.dart';

class HomeScreen extends StatelessWidget {
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
                          "Hi, John!",
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
                        "Reserved parking spaces",
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
                      child: Stack(
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
                                207,
                              ),
                              width: getHorizontalSize(
                                362,
                              ),
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
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: getPadding(
                                                  left: 2,
                                                  top: 12,
                                                  right: 4,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "NCP (National Car Parks)",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtMontserratMedium14Bluegray80001,
                                                        ),
                                                        Padding(
                                                          padding: getPadding(
                                                            top: 4,
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                "A03 (Base 2)",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtMontserratMedium14Bluegray30003,
                                                              ),
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
                                                                margin:
                                                                    getMargin(
                                                                  left: 16,
                                                                  bottom: 2,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    getPadding(
                                                                  left: 5,
                                                                  bottom: 2,
                                                                ),
                                                                child: Text(
                                                                  "3.3 km",
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
                                                    CustomIconButton(
                                                      height: 40,
                                                      width: 40,
                                                      margin: getMargin(
                                                        bottom: 1,
                                                      ),
                                                      variant: IconButtonVariant
                                                          .OutlineBlack9000f,
                                                      child: CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgQrcode,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  top: 22,
                                                  right: 4,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "10:00 AM",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtMontserratMedium18,
                                                    ),
                                                    CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgGroup159,
                                                      height: getVerticalSize(
                                                        8,
                                                      ),
                                                      width: getHorizontalSize(
                                                        117,
                                                      ),
                                                      margin: getMargin(
                                                        top: 7,
                                                        bottom: 6,
                                                      ),
                                                    ),
                                                    Text(
                                                      "11:00 PM",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtMontserratMedium18,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  top: 8,
                                                  right: 4,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "30 Apr, 2023",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtMontserratMedium14Bluegray30003,
                                                    ),
                                                    Text(
                                                      "30 Apr, 2023",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtMontserratMedium14Bluegray30003,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: getVerticalSize(
                                                  44,
                                                ),
                                                width: getHorizontalSize(
                                                  319,
                                                ),
                                                margin: getMargin(
                                                  top: 15,
                                                ),
                                                child: Stack(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      child: Row(
                                                        children: [
                                                          CustomIconButton(
                                                            height: 32,
                                                            width: 32,
                                                            variant:
                                                                IconButtonVariant
                                                                    .GradientGreenA200Teal500,
                                                            shape: IconButtonShape
                                                                .CircleBorder16,
                                                            child:
                                                                CustomImageView(
                                                              svgPath:
                                                                  ImageConstant
                                                                      .imgComputer,
                                                            ),
                                                          ),
                                                          CustomIconButton(
                                                            height: 32,
                                                            width: 32,
                                                            margin: getMargin(
                                                              left: 6,
                                                            ),
                                                            variant:
                                                                IconButtonVariant
                                                                    .GradientBlue300Blue700,
                                                            shape: IconButtonShape
                                                                .CircleBorder16,
                                                            child:
                                                                CustomImageView(
                                                              svgPath:
                                                                  ImageConstant
                                                                      .imgSignal,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      child: SizedBox(
                                                        width:
                                                            getHorizontalSize(
                                                          319,
                                                        ),
                                                        child: Divider(
                                                          height:
                                                              getVerticalSize(
                                                            1,
                                                          ),
                                                          thickness:
                                                              getVerticalSize(
                                                            1,
                                                          ),
                                                          color: ColorConstant
                                                              .gray100,
                                                        ),
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
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                                    itemCount: 3,
                                    itemBuilder: (context, index) {
                                      return ListsetpickuppoItemWidget();
                                    },
                                  ),
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
  }
}
