import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moniepoint_assessment/core/constants/app_assets.dart';
import 'package:moniepoint_assessment/core/constants/app_colors.dart';
import 'package:moniepoint_assessment/core/constants/app_constants.dart';
import 'package:moniepoint_assessment/core/constants/app_strings.dart';
import 'package:moniepoint_assessment/ui/map_page/notifier/map_notifier.dart';
import 'package:moniepoint_assessment/ui/map_page/widgets/filter_list.dart';

class MapStackFilterList extends ConsumerWidget {
  const MapStackFilterList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(18.ar),
      decoration: BoxDecoration(
        color: AppColors.neutralWhite,
        borderRadius: BorderRadius.circular(25.ar),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FilterList(
            icon: SvgAssets.safetyIcon,
            title: AppStrings.cosyAreas,
            selectedOption: ref.watch(mapNotifier).filterOption,
            onTap: () => ref
                .watch(mapNotifier.notifier)
                .setFilterOption(AppStrings.cosyAreas),
          ),
          FilterList(
            icon: SvgAssets.walletIcon,
            title: AppStrings.price,
            selectedOption: ref.watch(mapNotifier).filterOption,
            onTap: () => ref
                .watch(mapNotifier.notifier)
                .setFilterOption(AppStrings.price),
          ),
          FilterList(
            icon: SvgAssets.basketIcon,
            title: AppStrings.infrastructure,
            selectedOption: ref.watch(mapNotifier).filterOption,
            onTap: () => ref
                .watch(mapNotifier.notifier)
                .setFilterOption(AppStrings.infrastructure),
          ),
          FilterList(
            icon: SvgAssets.stackIcon,
            title: AppStrings.withoutAnyLayer,
            selectedOption: ref.watch(mapNotifier).filterOption,
            onTap: () => ref
                .watch(mapNotifier.notifier)
                .setFilterOption(AppStrings.withoutAnyLayer),
          ),
        ],
      ),
    );
  }
}
