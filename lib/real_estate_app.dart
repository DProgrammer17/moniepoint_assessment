import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_assessment/core/constants/app_colors.dart';
import 'package:moniepoint_assessment/core/constants/app_constants.dart';
import 'package:moniepoint_assessment/core/constants/app_strings.dart';
import 'package:moniepoint_assessment/core/theme/global_app_bar_theme.dart';
import 'package:moniepoint_assessment/ui/base_ui/bottom_nav_bar.dart';
import 'package:moniepoint_assessment/ui/home_page/home_page.dart';

class RealEstateApp extends StatelessWidget{
  const RealEstateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(AppConstants.designWidth, AppConstants.designHeight),
      splitScreenMode: true,
      minTextAdapt: false,
      builder: (_, child){
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            systemStatusBarContrastEnforced: true,
          ),
          child: MaterialApp(
            title: AppStrings.appName,
            theme: ThemeData(
              useMaterial3: false,
              primaryColor: AppColors.primaryOrange,
              scaffoldBackgroundColor: AppColors.neutralWhite,
              appBarTheme: globalAppBarTheme,
            ),
            debugShowCheckedModeBanner: false,
            home: const BottomNavBar(),
          ),
        );
      },
    );
  }

}