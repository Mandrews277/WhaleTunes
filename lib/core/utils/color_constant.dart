import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color whiteA700Dd = fromHex('#ddffffff');

  static Color gray700 = fromHex('#595959');

  static Color blueGray100 = fromHex('#d9d9d9');

  static Color black900 = fromHex('#000000');

  static Color bluegray400 = fromHex('#888888');

  static Color gray900 = fromHex('#292929');

  static Color gray90001 = fromHex('#1e1e1e');

  static Color lightBlue700 = fromHex('#0077e3');

  static Color black9003f = fromHex('#3f000000');

  static Color whiteA700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
