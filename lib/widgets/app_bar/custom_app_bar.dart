import 'package:flutter/material.dart';
import 'package:parking_assistant/core/app_export.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar(
      {required this.height,
      this.styleType,
      this.leadingWidth,
      this.leading,
      this.title,
      this.centerTitle,
      this.actions});

  double height;

  Style? styleType;

  double? leadingWidth;

  Widget? leading;

  Widget? title;

  bool? centerTitle;

  List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
        size.width,
        height,
      );
  _getStyle() {
    switch (styleType) {
      case Style.bgShadowIndigoA20033:
        return Container(
          height: getVerticalSize(
            58,
          ),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: ColorConstant.indigoA200,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                getHorizontalSize(
                  16,
                ),
              ),
              bottomRight: Radius.circular(
                getHorizontalSize(
                  16,
                ),
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: ColorConstant.indigoA20033,
                spreadRadius: getHorizontalSize(
                  2,
                ),
                blurRadius: getHorizontalSize(
                  2,
                ),
                offset: Offset(
                  0,
                  2,
                ),
              ),
            ],
          ),
        );
      default:
        return null;
    }
  }
}

enum Style {
  bgShadowIndigoA20033,
}
