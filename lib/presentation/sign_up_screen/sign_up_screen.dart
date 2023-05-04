import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:parking_assistant/core/app_export.dart';
import 'package:parking_assistant/presentation/login_screen/login_screen.dart';
import 'package:parking_assistant/widgets/custom_button.dart';
import 'package:parking_assistant/widgets/custom_text_form_field.dart';

 import '../../core/utils/firebase/AuthService.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repasswordController = TextEditingController();

   final AuthService _auth = AuthService();
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
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Enter Full Nane',
                    hintText: 'John',
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
                  controller: _emailController,
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
                  controller: _passwordController,
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
                  top: 21,
                ),
                child: TextField(
                  controller: _repasswordController,
                  decoration: InputDecoration(
                    labelText: 'Confrim Password',
                    border: OutlineInputBorder(),
                  ),
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.visiblePassword,
                  style: AppStyle.txtMontserratBold12Gray500,
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
                    text: "Sign UP",
                    margin: EdgeInsets.fromLTRB(6, 45, 5, 0),
                    variant: ButtonVariant.Outline,
                    fontStyle: ButtonFontStyle.MontserratSemiBold18Gray50,
                    onPressed: () async {
                      String email = _emailController.text;
                      String password = _passwordController.text;
                      String name = _nameController.text;

                      if (EmailValidator.validate(email)) {
                        if(password.length > 6 && password != null){
                          if(name != null){
                            String? result = await _auth.signUp(email, password, name);
                            if (result != null) {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) => Login_Screen()));

                            }else{
                              print(result);
                            }

                          }else{
                            print('All fileds are required');
                          }
                        }else{
                          print('password length must be gratter then 6');
                        }

                      } else {
                        print('email is invalid');
                        // email is invalid, show an error message
                      }
                    },
                  ),
                ),
              ),

              Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: getPadding(
                      top: 19,
                      bottom: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => Login_Screen()),
                            );
                          },
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
