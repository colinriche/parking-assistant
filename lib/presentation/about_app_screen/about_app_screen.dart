import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:parking_assistant/core/app_export.dart';
import 'package:parking_assistant/widgets/custom_button.dart';
import 'package:parking_assistant/widgets/custom_icon_button.dart';

class AboutAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray900,
        body: Container(
          height: size.height,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: size.height,
                  width: double.maxFinite,
                  padding: getPadding(
                    left: 24,
                    top: 25,
                    right: 24,
                    bottom: 25,
                  ),
                  decoration: AppDecoration.fillIndigoA200,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: getVerticalSize(
                            298,
                          ),
                          width: getHorizontalSize(
                            327,
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstant.whiteA700,
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                24,
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: ColorConstant.indigo400,
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
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: getPadding(
                            left: 24,
                            right: 24,
                            bottom: 27,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: getPadding(
                                  left: 1,
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: getPadding(
                                        top: 2,
                                      ),
                                      child: Text(
                                        "About App",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtSairaBold18,
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        left: 156,
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
                                        child: CustomIconButton(
                                          height: 32,
                                          width: 32,
                                          margin: getMargin(
                                            left: 156,
                                          ),
                                          variant: IconButtonVariant.Outline,
                                          shape: IconButtonShape.CircleBorder16,
                                          child: CustomImageView(
                                            svgPath: ImageConstant.imgTicket,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: getHorizontalSize(
                                  269,
                                ),
                                margin: getMargin(
                                  top: 12,
                                  right: 9,
                                ),
                                child: Text(
                                  "Parking Assistance operates and manages the parking facilities at various malls, shopping centers, and residential areas. Each facility contains many parking lots of different categories like VIP, Normal,\nReserved Slots etc. The parking slots are having different tariffs for (per hour) usage.",
                                  maxLines: null,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtMontserratRegular14,
                                ),
                              ),
                              CustomButton(
                                text: "Get Started",
                                margin: getMargin(
                                  top: 8,
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
              CustomImageView(
                imagePath: ImageConstant.imgGroup92,
                height: getVerticalSize(
                  366,
                ),
                width: getHorizontalSize(
                  375,
                ),
                alignment: Alignment.topCenter,
                margin: getMargin(
                  top: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
