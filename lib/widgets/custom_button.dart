import 'package:flutter/material.dart';
import 'package:parking_assistant/core/app_export.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.margin,
      this.onTap,
      this.width,
      this.height,
      this.text,
      this.prefixWidget,
      this.suffixWidget});

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  VoidCallback? onTap;

  double? width;

  double? height;

  String? text;

  Widget? prefixWidget;

  Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: onTap,
        style: _buildTextButtonStyle(),
        child: _buildButtonChildWidget(),
      ),
    );
  }

  _buildButtonChildWidget() {
    if (checkGradient()) {
      return Container(
        width: width ?? double.maxFinite,
        padding: _setPadding(),
        decoration: _buildDecoration(),
        child: _buildButtonWithOrWithoutIcon(),
      );
    } else {
      return _buildButtonWithOrWithoutIcon();
    }
  }

  _buildButtonWithOrWithoutIcon() {
    if (prefixWidget != null || suffixWidget != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixWidget ?? SizedBox(),
          Text(
            text ?? "",
            textAlign: TextAlign.center,
            style: _setFontStyle(),
          ),
          suffixWidget ?? SizedBox(),
        ],
      );
    } else {
      return Text(
        text ?? "",
        textAlign: TextAlign.center,
        style: _setFontStyle(),
      );
    }
  }

  _buildDecoration() {
    return BoxDecoration(
      border: _setBorder(),
      borderRadius: _setBorderRadius(),
      gradient: _setGradient(),
    );
  }

  _buildTextButtonStyle() {
    if (checkGradient()) {
      return TextButton.styleFrom(
        padding: EdgeInsets.zero,
      );
    } else {
      return TextButton.styleFrom(
        fixedSize: Size(
          width ?? double.maxFinite,
          height ?? getVerticalSize(40),
        ),
        padding: _setPadding(),
        side: _setTextButtonBorder(),
        shape: RoundedRectangleBorder(
          borderRadius: _setBorderRadius(),
        ),
      );
    }
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingAll14:
        return getPadding(
          all: 14,
        );
      case ButtonPadding.PaddingT5:
        return getPadding(
          left: 5,
          top: 5,
          bottom: 5,
        );
      default:
        return getPadding(
          all: 17,
        );
    }
  }

  _setTextButtonBorder() {
    switch (variant) {
      case ButtonVariant.OutlineGray20001:
        return BorderSide(
          color: ColorConstant.gray20001,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.GradientOrange200Yellow900:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.RoundedBorder8:
        return BorderRadius.circular(
          getHorizontalSize(
            8.00,
          ),
        );
      case ButtonShape.RoundedBorder4:
        return BorderRadius.circular(
          getHorizontalSize(
            4.00,
          ),
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            16.00,
          ),
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.MontserratSemiBold18Gray50:
        return TextStyle(
          color: ColorConstant.gray50,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.MontserratSemiBold22:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            22,
          ),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.MontserratMedium12:
        return TextStyle(
          color: ColorConstant.blueGray300,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
        );
      default:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        );
    }
  }

  _setBorder() {
    switch (variant) {
      case ButtonVariant.OutlineGray20001:
        return Border.all(
          color: ColorConstant.gray20001,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.GradientOrange200Yellow900:
        return null;
      default:
        return null;
    }
  }

  checkGradient() {
    switch (variant) {
      case ButtonVariant.Outline:
        return true;
      case ButtonVariant.OutlineGray20001:
        return false;
      default:
        return true;
    }
  }

  _setGradient() {
    switch (variant) {
      case ButtonVariant.Outline:
        return LinearGradient(
          begin: Alignment(
            1,
            0.13,
          ),
          end: Alignment(
            0.27,
            0.79,
          ),
          colors: [
            ColorConstant.indigoA100,
            ColorConstant.indigoA20001,
          ],
        );
      case ButtonVariant.OutlineGray20001:
        return null;
      default:
        return LinearGradient(
          begin: Alignment(
            0.5,
            0,
          ),
          end: Alignment(
            0.5,
            1,
          ),
          colors: [
            ColorConstant.orange200,
            ColorConstant.yellow900,
          ],
        );
    }
  }
}

enum ButtonShape {
  Square,
  RoundedBorder16,
  RoundedBorder8,
  RoundedBorder4,
}

enum ButtonPadding {
  PaddingAll17,
  PaddingAll14,
  PaddingT5,
}

enum ButtonVariant {
  GradientOrange200Yellow900,
  Outline,
  OutlineGray20001,
}

enum ButtonFontStyle {
  MontserratSemiBold18,
  MontserratSemiBold18Gray50,
  MontserratSemiBold22,
  MontserratMedium12,
}
