import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:parking_assistant/core/app_export.dart';

// ignore: must_be_immutable
class ListdirectionscItemWidget extends StatelessWidget {
  ListdirectionscItemWidget();

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        margin: getMargin(
          right: 12,
        ),
        decoration: AppDecoration.outline.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: getPadding(
                  top: 12,
                  bottom: 11,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgDirectionscarIndigoA200,
                          height: getVerticalSize(
                            16,
                          ),
                          width: getHorizontalSize(
                            18,
                          ),
                          margin: getMargin(
                            top: 3,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 9,
                          ),
                          child: Text(
                            "",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtMontserratSemiBold16Gray700,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: getPadding(
                        top: 10,
                      ),
                      child: Text(
                        "A 61026",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtMontserratMedium14Bluegray300,
                      ),
                    ),
                  ],
                ),
              ),
              OutlineGradientButton(
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
                    73,
                  ),
                  width: getHorizontalSize(
                    218,
                  ),
                  margin: getMargin(
                    left: 70,
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
            ],
          ),
        ),
      ),
    );
  }
}
