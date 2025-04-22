import 'dart:ui';

import 'package:flutter/cupertino.dart';

abstract class AppColors {
  static const primaryOrange = Color(0xFFFB9E11);
  static const secondaryGrey = Color(0xFFA5957E);
  static const textBlack = Color(0xFF232220);
  static const baseBlack = Color(0xFF2A2A2A);
  static const paleGrey = Color(0xFF737373);
  static const neutralGrey = Color(0xFFF4F5FE);
  static const neutralWhite = Color(0xFFFFFFFF);
  static const onlineGreen = Color(0xFF24C78B);
  static const failRed = Color(0xFFFF554A);
  static const softBrown = Color(0xFFA1998B);
}

class AppThemes{
  LinearGradient backgroundGradient = LinearGradient(
    colors: [
      AppColors.primaryOrange.withOpacity(0.1),
      AppColors.secondaryGrey.withOpacity(0.1),
    ],
  );
}
