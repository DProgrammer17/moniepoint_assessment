import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moniepoint_assessment/core/constants/app_colors.dart';
import 'package:moniepoint_assessment/core/constants/app_constants.dart';
import 'package:moniepoint_assessment/core/constants/app_textstyles.dart';
import 'package:moniepoint_assessment/core/extensions/widget_extensions.dart';

class FilterList extends StatelessWidget {
  final String icon;
  final String title;
  final String selectedOption;
  final VoidCallback onTap;
  const FilterList({
    super.key,
    required this.icon,
    required this.title,
    required this.selectedOption,
    required this.onTap,
  });

  bool get _selected => title == selectedOption;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            icon,
            height: 18.ah,
            color: _selected ? AppColors.primaryOrange : AppColors.baseBlack,
          ),
          10.sbW,
          Text(
            title,
            style: AppTextStyles.body2Regular.copyWith(
              color: _selected ? AppColors.primaryOrange : AppColors.baseBlack,
            ),
          ),
        ],
      ),
    );
  }
}
