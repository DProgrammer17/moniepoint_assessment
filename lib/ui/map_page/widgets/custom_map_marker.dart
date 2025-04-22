import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moniepoint_assessment/core/constants/app_assets.dart';
import 'package:moniepoint_assessment/core/constants/app_colors.dart';
import 'package:moniepoint_assessment/core/constants/app_constants.dart';
import 'package:moniepoint_assessment/core/constants/app_textstyles.dart';
import 'package:moniepoint_assessment/core/extensions/widget_extensions.dart';

class CustomMapMarker extends StatelessWidget {
  final String? price;
  final bool showPrice;
  const CustomMapMarker({
    super.key,
    this.price,
    this.showPrice = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(3.ar),
      decoration: BoxDecoration(
        color: AppColors.primaryOrange,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18.ar),
          topRight: Radius.circular(18.ar),
          bottomRight: Radius.circular(18.ar),
        ),
      ),
      child: showPrice
          ? Container()
          :   SvgPicture.asset(
        SvgAssets.hotelIcon,
        height: 48.ah,
        color: AppColors.neutralWhite,
      ),
    );
  }
}
