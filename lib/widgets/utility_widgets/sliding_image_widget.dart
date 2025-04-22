import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moniepoint_assessment/core/constants/app_assets.dart';
import 'package:moniepoint_assessment/core/constants/app_colors.dart';
import 'package:moniepoint_assessment/core/constants/app_constants.dart';
import 'package:moniepoint_assessment/core/constants/app_textstyles.dart';
import 'package:moniepoint_assessment/core/extensions/widget_extensions.dart';

class SlidingImageWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(radius ?? 18.ar),
          child: Image.asset(
            image,
            height: height,
            width: width,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 16.aw,
          right: 16.aw,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Text(
                        name,
                        style: AppTextStyles.body2Regular,
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
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
