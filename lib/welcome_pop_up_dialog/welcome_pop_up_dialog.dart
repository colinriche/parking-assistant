import 'package:flutter/material.dart';
import 'package:parking_assistant/core/app_export.dart';
import 'package:parking_assistant/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class WelcomePopUpDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getHorizontalSize(
        327,
      ),
      padding: getPadding(
        all: 24,
      ),
      decoration: AppDecoration.fillWhiteA700.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomImageView(
            svgPath: ImageConstant.imgGroup97,
            height: getVerticalSize(
              136,
            ),
            width: getHorizontalSize(
              218,
            ),
            margin: getMargin(
              left: 19,
              top: 11,
            ),
          ),
          Padding(
            padding: getPadding(
              left: 95,
              top: 24,
            ),
            child: Text(
              "Welcome",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtSairaBold18,
            ),
          ),
          Container(
            width: getHorizontalSize(
              269,
            ),
            margin: getMargin(
              top: 14,
              right: 9,
            ),
            child: Text(
              "Welcome to Parking Assistance. Now in order to use all the functionality of the app add your cars and addresses on the home page",
              maxLines: null,
              textAlign: TextAlign.left,
              style: AppStyle.txtMontserratRegular14,
            ),
          ),
          CustomButton(
            text: "OK",
            margin: getMargin(
              top: 20,
            ),
          ),
        ],
      ),
    );
  }
}
