import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moniepoint_assessment/core/constants/app_assets.dart';
import 'package:moniepoint_assessment/core/constants/app_colors.dart';
import 'package:moniepoint_assessment/core/constants/app_constants.dart';
import 'package:moniepoint_assessment/core/constants/app_strings.dart';
import 'package:moniepoint_assessment/core/constants/app_textstyles.dart';
import 'package:moniepoint_assessment/core/extensions/widget_extensions.dart';
import 'package:moniepoint_assessment/ui/home_page/notifier/home_notifier.dart';
import 'package:moniepoint_assessment/ui/home_page/widgets/home_name_tile.dart';
import 'package:moniepoint_assessment/ui/home_page/widgets/home_page_apartments_modal.dart';
import 'package:moniepoint_assessment/ui/home_page/widgets/home_profile.dart';
import 'package:moniepoint_assessment/widgets/page_widgets/app_scaffold.dart';
import 'package:moniepoint_assessment/widgets/utility_widgets/sliding_image_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeNotifier.notifier).initializeCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      padding: EdgeInsets.zero,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: AppThemes().backgroundGradient,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                60.sbH,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.aw),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnimatedSlide(
                            offset: Offset(ref.watch(homeNotifier).tileDx, 0),
                            duration: const Duration(seconds: 2),
                            curve: Curves.easeInOut,
                            child: const HomeNameTile(),
                          ),
                          const HomeProfile(),
                        ],
                      ),
                      32.sbH,
                      Text(
                        AppStrings.hiMarina,
                        style: AppTextStyles.h4.copyWith(
                          color: AppColors.softBrown,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                          .animate()
                          .fadeIn(
                            duration: const Duration(seconds: 1),
                          )
                          .slide(
                            duration: const Duration(seconds: 1),
                            begin: const Offset(0, 0.5),
                            end: const Offset(0, 0),
                          ),
                      8.sbH,
                      Text(
                        AppStrings.selectPerfectPlace,
                        style: AppTextStyles.h0.copyWith(
                          color: AppColors.textBlack,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                          .animate()
                          .fadeIn(
                            duration: const Duration(seconds: 1),
                          )
                          .slide(
                            duration: const Duration(seconds: 1),
                            begin: const Offset(0, 0.5),
                            end: const Offset(0, 0),
                          ),
                      32.sbH,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnimatedOpacity(
                            opacity: ref.watch(homeNotifier).fadeInCountTiles ? 1.0 : 0.0,
                            duration:const Duration(milliseconds: 700),
                            child: CircleAvatar(
                              radius: 90.ah,
                              backgroundColor: AppColors.primaryOrange,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    14.aw, 12.ah, 14.aw, 25.ah),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      AppStrings.buy,
                                      style: AppTextStyles.body2Regular.copyWith(
                                        color: AppColors.neutralWhite,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    18.sbH,
                                    Countup(
                                      begin: 0,
                                      end: 1034,
                                      duration: const Duration(seconds: 3),
                                      separator: ' ',
                                      style: AppTextStyles.h0.copyWith(
                                        color: AppColors.neutralWhite,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    10.sbH,
                                    Text(
                                      AppStrings.offers,
                                      style: AppTextStyles.body2Regular.copyWith(
                                        color: AppColors.neutralWhite,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                            opacity: ref.watch(homeNotifier).fadeInCountTiles ? 1.0 : 0.0,
                            duration:const Duration(milliseconds: 700),
                            child: Container(
                              height: 170.ah,
                              width: 170.aw,
                              alignment: Alignment.center,
                              padding:
                                  EdgeInsets.fromLTRB(14.aw, 12.ah, 14.aw, 25.ah),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18.ar),
                                color: AppColors.neutralWhite,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    AppStrings.buy,
                                    style: AppTextStyles.body2Regular.copyWith(
                                      color: AppColors.softBrown,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  18.sbH,
                                  Countup(
                                    begin: 0,
                                    end: 2212,
                                    duration: const Duration(seconds: 3),
                                    separator: ' ',
                                    style: AppTextStyles.h0.copyWith(
                                      color: AppColors.softBrown,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  10.sbH,
                                  Text(
                                    AppStrings.offers,
                                    style: AppTextStyles.body2Regular.copyWith(
                                      color: AppColors.softBrown,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                33.sbH,
                const HomePageApartmentsModal(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
