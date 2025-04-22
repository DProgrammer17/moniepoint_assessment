import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_places_autocomplete_text_field/google_places_autocomplete_text_field.dart';
import 'package:moniepoint_assessment/core/constants/app_assets.dart';
import 'package:moniepoint_assessment/core/constants/app_colors.dart';
import 'package:moniepoint_assessment/core/constants/app_constants.dart';
import 'package:moniepoint_assessment/core/constants/app_strings.dart';
import 'package:moniepoint_assessment/core/constants/app_textstyles.dart';
import 'package:moniepoint_assessment/ui/map_page/notifier/map_notifier.dart';

class MapSearchField extends ConsumerWidget {
  const MapSearchField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 56.ah,
      width: AppConstants.deviceWidth * 0.7,
      child: GooglePlacesAutoCompleteTextFormField(
        textEditingController: ref.watch(mapNotifier).mapTextController,
        googleAPIKey: AppStrings.googleMapAPIKey,
        style: AppTextStyles.body2Regular,
        countries: const ['ng'],
        decoration: InputDecoration(
          hintStyle: AppTextStyles.body2Regular,
          hintText: AppStrings.typeAddressHint,
          errorStyle: const TextStyle(color: AppColors.failRed),
          fillColor: AppColors.neutralWhite,
          filled: true,
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 8.aw),
            child: Image.asset(
              AppAssets.searchImage,
              color: AppColors.textBlack.withOpacity(0.9),
              scale: 20,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.ar),
            borderSide: const BorderSide(
              color: AppColors.neutralWhite,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.ar),
            borderSide: const BorderSide(
              color: AppColors.neutralWhite,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.ar),
            borderSide: const BorderSide(
              color: AppColors.neutralWhite,
            ),
          ),
        ),
        debounceTime: 400,
        fetchCoordinates: true,
        onPlaceDetailsWithCoordinatesReceived: (prediction) {
          ref.watch(mapNotifier.notifier).updateMapView(context,prediction);
        },
        onSuggestionClicked: (prediction) {
          ref.watch(mapNotifier.notifier).updateMapView(context,prediction);
        },
      ),
    );
  }
}
