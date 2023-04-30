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
                        right: 5,
                      ),
                      child:  Image.asset(
                        'assets/images/img_group92.png',
                        width: 60,
                        height: 50,
                        fit: BoxFit.fill,
                      ),

                    ),


                    Padding(
                      padding: getPadding(
                        top: 3,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Text(
                            "Parking text",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtRobotoMedium12,
                          ),
                          Padding(
                            padding: getPadding(
                              top: 4,
                            ),
                            child: Text(
                              "Parking text 2",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtRobotoMedium18,
                            ),
                          ),

                          Padding(
                            padding: getPadding(
                              top: 4,
                            ),
                            child:  Text(
                              "32.87909,72.5467565",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtRobotoMedium12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 102,
                        top: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/map_pin.png',
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
