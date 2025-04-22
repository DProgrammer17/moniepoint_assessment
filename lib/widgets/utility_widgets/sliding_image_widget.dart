import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moniepoint_assessment/core/constants/app_assets.dart';
import 'package:moniepoint_assessment/core/constants/app_colors.dart';
import 'package:moniepoint_assessment/core/constants/app_constants.dart';
import 'package:moniepoint_assessment/core/constants/app_textstyles.dart';
import 'package:moniepoint_assessment/core/extensions/widget_extensions.dart';

class SlidingImageWidget extends StatefulWidget {
  final double height;
  final double width;
  final double? radius;
  final String image;
  final String name;
  const SlidingImageWidget({
    super.key,
    required this.height,
    required this.width,
    required this.image,
    required this.name,
    this.radius,
  });

  @override
  State<SlidingImageWidget> createState() => _SlidingImageWidgetState();
}

class _SlidingImageWidgetState extends State<SlidingImageWidget> with SingleTickerProviderStateMixin{
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(milliseconds: 2800), vsync: this);
    animation = Tween<double>(begin: 400.aw, end: 16.aw).animate(controller)
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
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(widget.radius ?? 18.ar),
          child: Image.asset(
            widget.image,
            height: widget.height,
            width: widget.width,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 16.aw,
          right: animation.value,
          bottom: 12.ah,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.ar),
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  height: 50.ah,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200.withOpacity(0.5),
                  ),
                  child: animation.value <= 18.aw ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Text(
                        widget.name,
                        style: AppTextStyles.body2Regular,
                      ).animate()
                          .fadeIn(
                        duration: const Duration(milliseconds: 700),
                      ),
                      const Spacer(),
                      Container(
                        height: 45.ah,
                        width: 45.aw,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.neutralWhite,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.textBlack.withOpacity(0.2),
                              offset: const Offset(0, 0),
                              blurRadius: 10,
                              spreadRadius: 10,
                            )
                          ],
                        ),
                        child: Center(
                          child: SvgPicture.asset(SvgAssets.arrowIcon, height: 14.ah,),
                        ),
                      ),
                      2.sbW,
                    ],
                  ) : const SizedBox.shrink(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
