import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moniepoint_assessment/core/constants/app_colors.dart';
import 'package:moniepoint_assessment/core/constants/app_constants.dart';

class MapIconOptionTile extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;
  const MapIconOptionTile({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(13.ar),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.paleGrey.withOpacity(0.7),
        ),
        child: SvgPicture.asset(
          icon,
          height: 18.ah,
          color: AppColors.neutralWhite,
        ),
      ),
    );
  }
}
