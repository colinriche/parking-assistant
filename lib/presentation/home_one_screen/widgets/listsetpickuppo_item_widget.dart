import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:parking_assistant/core/app_export.dart';

// ignore: must_be_immutable
class ListsetpickuppoItemWidget extends StatelessWidget {
  ListsetpickuppoItemWidget();

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Padding(
        padding: getPadding(
          right: 16,
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
              left: 9,
              top: 11,
              right: 9,
              bottom: 11,
            ),
            decoration: AppDecoration.outline.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: getPadding(
                        top: 3,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtRobotoMedium12,
                          ),
                          Padding(
                            padding: getPadding(
                              top: 4,
                            ),
                            child: Text(
                              "",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtRobotoMedium18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 102,
                        bottom: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "‎60",
                                  style: TextStyle(
                                    color: ColorConstant.indigoA200,
                                    fontSize: getFontSize(
                                      15.269556045532227,
                                    ),
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: " ",
                                  style: TextStyle(
                                    color: ColorConstant.indigoA200,
                                    fontSize: getFontSize(
                                      15.269556045532227,
                                    ),
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: "USD\n",
                                  style: TextStyle(
                                    color: ColorConstant.indigoA200,
                                    fontSize: getFontSize(
                                      12,
                                    ),
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Padding(
                            padding: getPadding(
                              top: 2,
                            ),
                            child: Text(
                              "for hr",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtRobotoMedium694,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: getPadding(
                    top: 12,
                    bottom: 3,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                        svgPath: ImageConstant.imgContrast,
                        height: getSize(
                          18,
                        ),
                        width: getSize(
                          18,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 3,
                          top: 2,
                        ),
                        child: Text(
                          "",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtRobotoMedium12,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 79,
                          top: 1,
                          bottom: 1,
                        ),
                        child: Text(
                          "",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtRobotoMedium12,
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
    );
  }
}
