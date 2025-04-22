import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moniepoint_assessment/core/constants/app_assets.dart';
import 'package:moniepoint_assessment/core/constants/app_colors.dart';
import 'package:moniepoint_assessment/core/constants/app_constants.dart';
import 'package:moniepoint_assessment/core/constants/app_strings.dart';
import 'package:moniepoint_assessment/core/extensions/widget_extensions.dart';
import 'package:moniepoint_assessment/ui/home_page/notifier/home_notifier.dart';
import 'package:moniepoint_assessment/widgets/utility_widgets/sliding_image_widget.dart';

class HomePageApartmentsModal extends ConsumerStatefulWidget {
  const HomePageApartmentsModal({super.key});

  @override
  ConsumerState<HomePageApartmentsModal> createState() => _HomePageApartmentsModalState();
}

class _HomePageApartmentsModalState extends ConsumerState<HomePageApartmentsModal>{
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeNotifier.notifier).initializeModal();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
        offset: Offset(0, ref.watch(homeNotifier).modalDy),
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOut,
        child: Container(
        padding: EdgeInsets.all(9.ar),
        constraints: BoxConstraints(
          minHeight: AppConstants.deviceHeight * 0.41,
          minWidth: AppConstants.deviceWidth,
        ),
        decoration: BoxDecoration(
          color: AppColors.neutralWhite,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              30.ar,
            ),
          ),
        ),
        child: Wrap(
          children: [
            SlidingImageWidget(
              image: AppAssets.gladImage,
              height: 200.ah,
              width: AppConstants.deviceWidth,
              name: AppStrings.gladStreet,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 8.ah, 8.aw, 8.ah),
              child: SlidingImageWidget(
                image: AppAssets.gubinaImage,
                height: AppConstants.deviceHeight * 0.417,
                width: AppConstants.deviceWidth * 0.465,
                name: AppStrings.gubinaStreet,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.ah),
              child: Column(
                children: [
                  SlidingImageWidget(
                    image: AppAssets.trefolevaImage,
                    height: AppConstants.deviceHeight * 0.2,
                    width: AppConstants.deviceWidth * 0.47,
                    name: AppStrings.trefolevaStreet,
                  ),
                  12.sbH,
                  SlidingImageWidget(
                    image: AppAssets.sedovaImage,
                    height: AppConstants.deviceHeight * 0.2,
                    width: AppConstants.deviceWidth * 0.47,
                    name: AppStrings.sedovaStreet,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
