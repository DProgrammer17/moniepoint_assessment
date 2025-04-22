import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:moniepoint_assessment/core/constants/app_colors.dart';
import 'package:moniepoint_assessment/core/constants/app_constants.dart';

abstract class AppMessages {
  static void showInfoMessage(
          {required BuildContext context, required String message}) =>
      Fluttertoast.showToast(
        msg: message,
      //  fontAsset: AppStrings.fontFamily,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: AppColors.primaryOrange.withOpacity(0.4),
        textColor: AppColors.neutralWhite,
        fontSize: 14.asp,
      );

  static void showSuccessMessage(
          {required BuildContext context, required String message}) =>
      Fluttertoast.showToast(
        msg: message,
     //   fontAsset: AppStrings.fontFamily,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: AppColors.primaryOrange.withOpacity(0.8),
        textColor: AppColors.neutralWhite,
        fontSize: 14.asp,
      );

  static void showErrorMessage(
          {required BuildContext context,
          required String message}) =>
      Fluttertoast.showToast(
        msg: message,
      //  fontAsset: AppStrings.fontFamily,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: AppColors.failRed.withOpacity(0.8),
        textColor: AppColors.neutralWhite,
        fontSize: 14.asp,
      );
}
