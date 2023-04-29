import 'package:flutter/material.dart';
import 'package:parking_assistant/core/app_export.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton(
      {this.shape,
      this.padding,
      this.variant,
      this.alignment,
      this.margin,
      this.width,
      this.height,
      this.child,
      this.onTap});

  IconButtonShape? shape;

  IconButtonPadding? padding;

  IconButtonVariant? variant;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  double? width;

  double? height;

  Widget? child;

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildIconButtonWidget(),
          )
        : _buildIconButtonWidget();
  }

  _buildIconButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: IconButton(
        visualDensity: VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
        iconSize: getSize(height ?? 0),
        padding: EdgeInsets.all(0),
        icon: Container(
          alignment: Alignment.center,
          width: getSize(width ?? 0),
          height: getSize(height ?? 0),
          padding: _setPadding(),
          decoration: _buildDecoration(),
          child: child,
        ),
        onPressed: onTap,
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      borderRadius: _setBorderRadius(),
      gradient: _setGradient(),
      boxShadow: _setBoxShadow(),
    );
  }

  _setPadding() {
    switch (padding) {
      case IconButtonPadding.PaddingAll10:
        return getPadding(
          all: 10,
        );
      case IconButtonPadding.PaddingAll15:
        return getPadding(
          all: 15,
        );
      case IconButtonPadding.PaddingAll19:
        return getPadding(
          all: 19,
        );
      default:
        return getPadding(
          all: 6,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case IconButtonVariant.OutlineGray70019:
        return ColorConstant.red300;
      case IconButtonVariant.OutlineGray70033:
        return ColorConstant.whiteA700;
      case IconButtonVariant.FillBlue50:
        return ColorConstant.blue50;
      case IconButtonVariant.OutlineBlack9000f:
        return ColorConstant.whiteA700;
      case IconButtonVariant.FillIndigoA200:
        return ColorConstant.indigoA200;
      case IconButtonVariant.FillTeal500:
        return ColorConstant.teal500;
      case IconButtonVariant.Outline:
      case IconButtonVariant.GradientGreenA200Teal500:
      case IconButtonVariant.GradientBlue300Blue700:
        return null;
      default:
        return ColorConstant.whiteA700;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case IconButtonShape.RoundedBorder10:
        return BorderRadius.circular(
          getHorizontalSize(
            10.00,
          ),
        );
      case IconButtonShape.CircleBorder16:
        return BorderRadius.circular(
          getHorizontalSize(
            16.00,
          ),
        );
      case IconButtonShape.CircleBorder24:
        return BorderRadius.circular(
          getHorizontalSize(
            24.00,
          ),
        );
      case IconButtonShape.CircleBorder28:
        return BorderRadius.circular(
          getHorizontalSize(
            28.00,
          ),
        );
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            6.00,
          ),
        );
    }
  }

  _setGradient() {
    switch (variant) {
      case IconButtonVariant.Outline:
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
      case IconButtonVariant.GradientGreenA200Teal500:
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
            ColorConstant.greenA200,
            ColorConstant.teal500,
          ],
        );
      case IconButtonVariant.GradientBlue300Blue700:
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
            ColorConstant.blue300,
            ColorConstant.blue700,
          ],
        );
      case IconButtonVariant.FillWhiteA700:
      case IconButtonVariant.OutlineGray70019:
      case IconButtonVariant.OutlineGray70033:
      case IconButtonVariant.FillBlue50:
      case IconButtonVariant.OutlineBlack9000f:
      case IconButtonVariant.FillIndigoA200:
      case IconButtonVariant.FillTeal500:
        return null;
      default:
        return null;
    }
  }

  _setBoxShadow() {
    switch (variant) {
      case IconButtonVariant.OutlineGray70019:
        return [
          BoxShadow(
            color: ColorConstant.gray70019,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              5,
            ),
          ),
        ];
      case IconButtonVariant.OutlineGray70033:
        return [
          BoxShadow(
            color: ColorConstant.gray70033,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              10,
            ),
          ),
        ];
      case IconButtonVariant.OutlineBlack9000f:
        return [
          BoxShadow(
            color: ColorConstant.black9000f,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              17.69,
            ),
          ),
        ];
      case IconButtonVariant.FillWhiteA700:
      case IconButtonVariant.Outline:
      case IconButtonVariant.FillBlue50:
      case IconButtonVariant.GradientGreenA200Teal500:
      case IconButtonVariant.GradientBlue300Blue700:
      case IconButtonVariant.FillIndigoA200:
      case IconButtonVariant.FillTeal500:
        return null;
      default:
        return null;
    }
  }
}

enum IconButtonShape {
  RoundedBorder10,
  CircleBorder16,
  CircleBorder24,
  CircleBorder28,
  RoundedBorder6,
}

enum IconButtonPadding {
  PaddingAll10,
  PaddingAll6,
  PaddingAll15,
  PaddingAll19,
}

enum IconButtonVariant {
  FillWhiteA700,
  Outline,
  OutlineGray70019,
  OutlineGray70033,
  FillBlue50,
  OutlineBlack9000f,
  GradientGreenA200Teal500,
  GradientBlue300Blue700,
  FillIndigoA200,
  FillTeal500,
}
