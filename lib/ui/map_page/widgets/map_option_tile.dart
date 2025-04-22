import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moniepoint_assessment/core/constants/app_colors.dart';
import 'package:moniepoint_assessment/core/constants/app_constants.dart';
import 'package:moniepoint_assessment/core/constants/app_textstyles.dart';
import 'package:moniepoint_assessment/core/extensions/widget_extensions.dart';

class MapOptionTile extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;
  const MapOptionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.ah, horizontal: 15.aw),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.ar),
          color: AppColors.paleGrey.withOpacity(0.7),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icon,
              height: 18.ah,
              color: AppColors.neutralWhite,
            ),
            8.sbW,
            Text(
              title,
              style: AppTextStyles.body2Regular.copyWith(
                color: AppColors.neutralWhite
              ),
            ),
          ],
        ),
      ),
    );
  }
}
