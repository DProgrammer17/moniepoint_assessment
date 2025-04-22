import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moniepoint_assessment/core/constants/app_assets.dart';
import 'package:moniepoint_assessment/core/constants/app_colors.dart';
import 'package:moniepoint_assessment/core/constants/app_constants.dart';
import 'package:moniepoint_assessment/core/constants/app_strings.dart';
import 'package:moniepoint_assessment/core/constants/app_textstyles.dart';
import 'package:moniepoint_assessment/core/extensions/widget_extensions.dart';

class HomeNameTile extends StatefulWidget {
  const HomeNameTile({super.key});

  @override
  State<HomeNameTile> createState() => _HomeNameTileState();
}

class _HomeNameTileState extends State<HomeNameTile> with SingleTickerProviderStateMixin{
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = Tween<double>(begin: 0, end: 150.aw).animate(controller)
      ..addListener(() {setState(() {

      });});
    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: animation.value >= 80.aw ? 1.0 : 0.0,
      duration:const Duration(seconds: 1),
      child: Container(
        width: animation.value,
        padding: EdgeInsets.symmetric(vertical: 10.ah, horizontal: 8.aw),
        decoration: BoxDecoration(
          color: AppColors.neutralWhite,
          borderRadius: BorderRadius.circular(6.ar),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              SvgAssets.mapIcon,
              height: 15.ah,
              color: AppColors.softBrown,
            ),
            8.sbW,
            animation.value >= 150.aw ? Text(
              AppStrings.stPete,
              style: AppTextStyles.body2Regular.copyWith(
                color: AppColors.softBrown,
                fontWeight: FontWeight.w300,
              ),
            ): const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
