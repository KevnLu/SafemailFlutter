import 'dart:ui';

class ColorsUtil {
  static Color hexColor(String colorString, {double alpha = 1.0}) {
    String colorStr = colorString;

    if (!colorStr.startsWith('0xff') && colorStr.length == 6) {
      colorStr = '0xff' + colorStr;
    }

    if (colorStr.startsWith('0x') && colorStr.length == 8) {
      colorStr = colorStr.replaceRange(0, 2, '0xff');
    }

    if (colorStr.startsWith('#') && colorStr.length == 7) {
      colorStr = colorStr.replaceRange(0, 1, '0xff');
    }

    Color color = Color(int.parse(colorStr));
    int red = color.red;
    int green = color.green;
    int blue = color.blue;

    return Color.fromRGBO(red, green, blue, alpha);
  }
}
