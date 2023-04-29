import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:parking_assistant/core/app_export.dart';
import 'package:parking_assistant/widgets/custom_button.dart';

class Login_Screen extends StatelessWidget {
  TextEditingController weburlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray50,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 32,
            top: 20,
            right: 32,
            bottom: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgScreenshot20210525,
                height: getSize(
                  84,
                ),
                width: getSize(
                  84,
                ),
                radius: BorderRadius.circular(
                  getHorizontalSize(
                    12,
                  ),
                ),
                alignment: Alignment.center,
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: getPadding(
                    top: 12,
                  ),
                  child: Text(
                    "Parking Assistance".toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtMontserratMedium12,
                  ),
                ),
              ),

              Padding(
                padding: getPadding(
                  top: 47,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter your email',
                    hintText: 'example@gmail.com',
                    border: OutlineInputBorder(),
                  ),
                  textAlign: TextAlign.left,
                  style: AppStyle.txtMontserratBold12Gray500,
                ),
              ),

              Padding(
                padding: getPadding(
                  top: 21,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Password',
                    border: OutlineInputBorder(),
                  ),
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.visiblePassword,
                  style: AppStyle.txtMontserratBold12Gray500,
                ),
              ),


              Padding(
                padding: getPadding(
                  top: 24,
                  right: 46,
                ),
                child: Row(
                  children: [
                    Container(
                      height: getSize(
                        24,
                      ),
                      width: getSize(
                        24,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(
                            4,
                          ),
                        ),
                        border: Border.all(
                          color: ColorConstant.blueGray100,
                          width: getHorizontalSize(
                            1,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 9,
                        top: 4,
                        bottom: 1,
                      ),
                      child: Text(
                        "I agree with terms and conditions",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtMontserratMedium14,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 6,
                  top: 5,
                  right: 5,
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
                  child: CustomButton(
                    text: "Login",
                    margin: getMargin(
                      left: 6,
                      top: 45,
                      right: 5,
                    ),
                    variant: ButtonVariant.Outline,
                    fontStyle: ButtonFontStyle.MontserratSemiBold18Gray50,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}