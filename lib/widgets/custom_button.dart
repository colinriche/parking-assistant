import 'package:flutter/material.dart';

enum ButtonVariant { Elevated, Outline }
enum ButtonFontStyle { MontserratSemiBold18Gray50, MontserratSemiBold20White }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final EdgeInsets margin;
  final ButtonVariant variant;
  final ButtonFontStyle fontStyle;

  const CustomButton({
    required this.text,
    required this.onPressed,
    this.margin = const EdgeInsets.all(0),
    this.variant = ButtonVariant.Elevated,
    this.fontStyle = ButtonFontStyle.MontserratSemiBold18Gray50,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color borderColor;
    Color textColor;

    switch (variant) {
      case ButtonVariant.Outline:
        backgroundColor = Colors.transparent;
        borderColor = Colors.grey.shade500;
        textColor = Colors.grey.shade500;
        break;
      case ButtonVariant.Elevated:
      default:
        backgroundColor = Colors.grey.shade500;
        borderColor = Colors.transparent;
        textColor = Colors.white;
        break;
    }

    TextStyle style;

    switch (fontStyle) {
      case ButtonFontStyle.MontserratSemiBold20White:
        style = TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: textColor,
        );
        break;
      case ButtonFontStyle.MontserratSemiBold18Gray50:
      default:
        style = TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: textColor,
        );
        break;
    }

    return Container(
      margin: margin,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          onPrimary: textColor,
          onSurface: borderColor,
          side: BorderSide(
            color: borderColor,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }
}
