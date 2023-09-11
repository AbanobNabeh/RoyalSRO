import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utils/app_colors.dart';

class AppTheme {
  static ThemeData darktheme() {
    return ThemeData(
        bottomSheetTheme:
            BottomSheetThemeData(backgroundColor: Colors.transparent),
        appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              statusBarColor: AppColors.black,
              statusBarIconBrightness: Brightness.light,
            ),
            actionsIconTheme: IconThemeData(color: AppColors.white),
            backgroundColor: AppColors.black,
            elevation: 0,
            iconTheme: IconThemeData(color: AppColors.white),
            titleTextStyle: TextStyle(
              color: AppColors.primercolor,
              fontFamily: "Marhey-Medium",
              fontSize: 25,
            )),
        fontFamily: 'Marhey-Medium',
        backgroundColor: AppColors.black,
        scaffoldBackgroundColor: AppColors.black);
  }
}
