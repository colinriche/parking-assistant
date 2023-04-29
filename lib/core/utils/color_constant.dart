import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color black9007f = fromHex('#7f000000');

  static Color gray5001 = fromHex('#fbfbfd');

  static Color indigoA20002 = fromHex('#5676e6');

  static Color gray5002 = fromHex('#f8f8ff');

  static Color indigoA20001 = fromHex('#646cee');

  static Color gray5003 = fromHex('#fbfbfb');

  static Color indigoA100 = fromHex('#959bff');

  static Color indigoA10033 = fromHex('#338b91fc');

  static Color green500 = fromHex('#42c942');

  static Color whiteA70099 = fromHex('#99ffffff');

  static Color teal500 = fromHex('#009688');

  static Color gray20001 = fromHex('#eeeeee');

  static Color blueGray90001 = fromHex('#2e2e2e');

  static Color gray20002 = fromHex('#e8e8e8');

  static Color blueGray900 = fromHex('#323643');

  static Color gray70033 = fromHex('#33606470');

  static Color blueGray40075 = fromHex('#7587879c');

  static Color blueGray100 = fromHex('#cdd4dc');

  static Color blue700 = fromHex('#3277d8');

  static Color blueGray300 = fromHex('#a5a9b7');

  static Color indigoA20019 = fromHex('#197077f2');

  static Color black9000f = fromHex('#0f000000');

  static Color gray200 = fromHex('#f0f0f0');

  static Color gray10006 = fromHex('#f3f3ff');

  static Color orange200 = fromHex('#ffb981');

  static Color blue50 = fromHex('#e9f1ff');

  static Color indigoA200C1 = fromHex('#c17077f2');

  static Color indigoA10001 = fromHex('#9499f6');

  static Color gray10003 = fromHex('#f6f6fa');

  static Color indigo400 = fromHex('#5359d6');

  static Color gray10002 = fromHex('#f4f4fa');

  static Color whiteA70066 = fromHex('#66ffffff');

  static Color gray10005 = fromHex('#f4f4f4');

  static Color gray10004 = fromHex('#eef1fb');

  static Color gray10001 = fromHex('#f2f5fb');

  static Color blue300 = fromHex('#6f9fe2');

  static Color indigoA1001901 = fromHex('#19949aff');

  static Color black90019 = fromHex('#19000000');

  static Color blueGray40001 = fromHex('#888888');

  static Color whiteA700 = fromHex('#ffffff');

  static Color indigoA10019 = fromHex('#198b91fc');

  static Color indigoA200 = fromHex('#656cee');

  static Color red300 = fromHex('#f86e6e');

  static Color greenA200 = fromHex('#75e2ae');

  static Color gray50 = fromHex('#f7f7fa');

  static Color blueGray80002 = fromHex('#203c64');

  static Color blue7004f = fromHex('#4f3176d8');

  static Color black900 = fromHex('#000000');

  static Color gray70019 = fromHex('#19606470');

  static Color yellow900 = fromHex('#ff8a2c');

  static Color blueGray800 = fromHex('#333e63');

  static Color indigoA100C1 = fromHex('#c1949aff');

  static Color indigoA20033 = fromHex('#33656cee');

  static Color gray700 = fromHex('#606470');

  static Color gray500 = fromHex('#9594a7');

  static Color blueGray400 = fromHex('#6d809b');

  static Color indigo50 = fromHex('#ecedff');

  static Color blueGray600 = fromHex('#5a5a7e');

  static Color gray900 = fromHex('#1e1e20');

  static Color blueGray30003 = fromHex('#a5aab7');

  static Color gray300 = fromHex('#dbdbdb');

  static Color blueGray80001 = fromHex('#203d65');

  static Color blueGray30001 = fromHex('#8498b4');

  static Color blueGray30002 = fromHex('#8397b3');

  static Color gray100 = fromHex('#f1f2fe');

  static Color whiteA70000 = fromHex('#00ffffff');

  static Color gray70026 = fromHex('#26606470');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
