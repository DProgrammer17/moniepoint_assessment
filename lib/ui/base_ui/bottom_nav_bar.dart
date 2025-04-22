import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moniepoint_assessment/core/constants/app_assets.dart';
import 'package:moniepoint_assessment/core/constants/app_colors.dart';
import 'package:moniepoint_assessment/core/constants/app_constants.dart';
import 'package:moniepoint_assessment/ui/base_ui/notifier/base_ui_notifier.dart';
import 'package:moniepoint_assessment/widgets/page_widgets/app_scaffold.dart';

class BottomNavBar extends ConsumerStatefulWidget {
  final int? currentIndex;
  const BottomNavBar({super.key, this.currentIndex});

  @override
  ConsumerState<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<BottomNavBar> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(baseNotifier.notifier).initializeNavBarOffset();
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
      body: IndexedStack(
        index: ref.watch(baseNotifier).currentIndex ?? 2,
        children: ref.watch(baseNotifier).navPages,
      ),
      bottomNavigationBar: AnimatedSlide(
        offset: Offset(0, ref.watch(baseNotifier).navDy),
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOut,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.ah, horizontal: 60.aw),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 2.ah, horizontal: 3.aw),
            decoration: BoxDecoration(
              color: AppColors.baseBlack,
              borderRadius: BorderRadius.circular(50.ar),
            ),
            child: BottomNavigationBar(
              onTap: (index) => ref
                  .watch(baseNotifier.notifier)
                  .updateNavIndex(widget.currentIndex ?? index),
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconSize: 0,
              selectedFontSize: 0,
              unselectedFontSize: 0,
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Container(
                    padding: EdgeInsets.all(
                        ref.watch(baseNotifier).currentIndex == 0
                            ? 18.ar
                            : 10.ar),
                    decoration: BoxDecoration(
                      color: ref.watch(baseNotifier).currentIndex == 0
                          ? AppColors.primaryOrange
                          : AppColors.textBlack,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      AppAssets.searchHomeIcon,
                      height: ref.watch(baseNotifier).currentIndex == 0
                          ? 26.ah
                          : 20.ah,
                      color: AppColors.neutralWhite,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    padding: EdgeInsets.all(
                        ref.watch(baseNotifier).currentIndex == 1
                            ? 18.ar
                            : 10.ar),
                    decoration: BoxDecoration(
                      color: ref.watch(baseNotifier).currentIndex == 1
                          ? AppColors.primaryOrange
                          : AppColors.textBlack,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      AppAssets.chatHomeIcon,
                      height: ref.watch(baseNotifier).currentIndex == 1
                          ? 26.ah
                          : 20.ah,
                      color: AppColors.neutralWhite,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    padding: EdgeInsets.all(
                        ref.watch(baseNotifier).currentIndex == 2
                            ? 18.ar
                            : 10.ar),
                    decoration: BoxDecoration(
                      color: ref.watch(baseNotifier).currentIndex == 2
                          ? AppColors.primaryOrange
                          : AppColors.textBlack,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      AppAssets.homeIcon,
                      height: ref.watch(baseNotifier).currentIndex == 2
                          ? 26.ah
                          : 20.ah,
                      color: AppColors.neutralWhite,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    padding: EdgeInsets.all(
                        ref.watch(baseNotifier).currentIndex == 3
                            ? 18.ar
                            : 10.ar),
                    decoration: BoxDecoration(
                      color: ref.watch(baseNotifier).currentIndex == 3
                          ? AppColors.primaryOrange
                          : AppColors.textBlack,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      AppAssets.heartHomeIcon,
                      height: ref.watch(baseNotifier).currentIndex == 3
                          ? 26.ah
                          : 20.ah,
                      color: AppColors.neutralWhite,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    padding: EdgeInsets.all(
                        ref.watch(baseNotifier).currentIndex == 4
                            ? 18.ar
                            : 10.ar),
                    decoration: BoxDecoration(
                      color: ref.watch(baseNotifier).currentIndex == 4
                          ? AppColors.primaryOrange
                          : AppColors.textBlack,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      AppAssets.userHomeIcon,
                      height: ref.watch(baseNotifier).currentIndex == 4
                          ? 26.ah
                          : 20.ah,
                      color: AppColors.neutralWhite,
                    ),
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
