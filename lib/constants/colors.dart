import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class


  static const Map<int, Color> orange = const <int, Color>{
    50: const Color(0xFFFCF2E7),
    100: const Color(0xFFF8DEC3),
    200: const Color(0xFFF3C89C),
    300: const Color(0xFFEEB274),
    400: const Color(0xFFEAA256),
    500: const Color(0xFFE69138),
    600: const Color(0xFFE38932),
    700: const Color(0xFFDF7E2B),
    800: const Color(0xFFDB7424),
    900: const Color(0xFFD56217)
  };

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);
  static const String fontName = 'WorkSans';

  static const Color background = Color(0xFFF2F3F8);
  static const Color nearlyDarkBlue = Color(0xFF2633C5);
  
  static const Color white50 = Color(0xFFFFFFFF);
  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color nearlyWhite = Color(0xFFFEFEFE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color white50Alpha060 = Color(0x99FFFFFF);

  static const Color black800 = Color(0xFF121212);
  static const Color black900 = Color(0xFF000000);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);

  static const Color blue50 = Color(0xFFEEF0F2);
  static const Color blue100 = Color(0xFFD2DBE0);
  static const Color blue200 = Color(0xFFADBBC4);
  static const Color blue300 = Color(0xFF8CA2AE);
  static const Color blue600 = Color(0xFF4A6572);
  static const Color blue700 = Color(0xFF344955);
  static const Color blue800 = Color(0xFF232F34);
  static const Color bluePeriwinkle = Color(0xFF8E97FD);
  static const Color bluePeriwinkleDark = Color.fromARGB(255, 153, 159, 230);

  static const Color orange300 = Color(0xFFFBD790);
  static const Color orange400 = Color(0xFFF9BE64);
  static const Color orange500 = Color(0xFFF9AA33);

  static const Color red200 = Color(0xFFCF7779);
  static const Color red400 = Color(0xFFFF4C5D);

  static const Color blue50Alpha060 = Color(0x99EEF0F2);

  static const Color black900Alpha020 = Color(0x33000000);
  static const Color black900Alpha087 = Color(0xDE000000);
  static const Color black900Alpha060 = Color(0x99000000);

  static const Color greyLabel = Color(0xFFAEAEAE);
  static const Color darkBottomAppBarBackground = Color(0xFF2D2D2D);
  static const Color darkDrawerBackground = Color(0xFF353535);
  static const Color darkCardBackground = Color(0xFF1E1E1E);
  static const Color darkChipBackground = Color(0xFF2A2A2A);
  static const Color lightChipBackground = Color(0xFFE5E5E5);
}
