import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:widget_to_marker/widget_to_marker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_autocomplete_text_field/google_places_autocomplete_text_field.dart';
import 'package:moniepoint_assessment/core/constants/app_assets.dart';
import 'package:moniepoint_assessment/core/constants/app_constants.dart';
import 'package:moniepoint_assessment/core/constants/app_strings.dart';
import 'package:moniepoint_assessment/domain/api_request/nearby_place_request.dart';
import 'package:moniepoint_assessment/domain/network/google_place_api.dart';
import 'package:moniepoint_assessment/ui/map_page/notifier/map_model.dart';
import 'package:moniepoint_assessment/ui/map_page/widgets/custom_map_marker.dart';
import 'package:moniepoint_assessment/ui/map_page/widgets/filter_list.dart';
import 'package:moniepoint_assessment/widgets/utility_widgets/app_toast.dart';

final mapNotifier = NotifierProvider<MapNotifier, MapModel>(() {
  return MapNotifier();
});

class MapNotifier extends Notifier<MapModel> {
  @override
  MapModel build() => MapModel(
        mapTextController: TextEditingController(),
      );

  void setMapController(GoogleMapController controller) async {
    state = state.copyWith(mapController: controller);
    state.mapController?.setMapStyle(
      await rootBundle.loadString(JsonAssets.darkModeUrl),
    );
  }

  Future<void> getCurrentLocation(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      AppMessages.showErrorMessage(
        context: context,
        message: ErrorStrings.locationServiceDisabled,
      );
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        AppMessages.showErrorMessage(
          context: context,
          message: ErrorStrings.enableLocationPermission,
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      AppMessages.showErrorMessage(
        context: context,
        message: ErrorStrings.enableLocationPermission,
      );
      return;
    }

    final Position position = await Geolocator.getCurrentPosition();
    state.mapController?.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(
          position.latitude,
          position.longitude,
        ),
        zoom: 16.4746,
      ),
    ));
    state = state.copyWith(
      currentLocation: position,
      mapMarkers: {
        Marker(
          markerId: const MarkerId('1'),
          position: LatLng(
            position.latitude,
            position.longitude,
          ),
          infoWindow: const InfoWindow(
            title: AppStrings.currentLocation,
          ),
        ),
      },
    );

    await getNearbyApartmentDetails(
      context: context,
      lat: position.latitude,
      lgt: position.longitude,
    );
  }

  void updateMapView(BuildContext context, Prediction prediction) async{
    state = state.copyWith(
      mapTextController:
          TextEditingController(text: prediction.description ?? ''),
    );
    state.mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            double.parse(
                prediction.lat ?? state.currentLocation!.latitude.toString()),
            double.parse(
                prediction.lng ?? state.currentLocation!.longitude.toString()),
          ),
          zoom: 16.4746,
        ),
      ),
    );
    await getNearbyApartmentDetails(
    context: context,
    lat:  double.parse(
        prediction.lat ?? state.currentLocation!.latitude.toString()),
    lgt: double.parse(
        prediction.lng ?? state.currentLocation!.longitude.toString()),
    );
  }

  void setFilterOption(String option) =>
      state = state.copyWith(filterOption: option);

  void showMapFilterPopUpMenu(BuildContext context) => showMenu(
        context: context,
        position: RelativeRect.fromLTRB(
            30.aw, AppConstants.deviceHeight * 0.57, 100.aw, 5.ah),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.ar),
        ),
        items: [
          PopupMenuItem(
            enabled: true,
            value: '',
            onTap: () => setFilterOption(AppStrings.cosyAreas),
            child: FilterList(
              icon: SvgAssets.safetyIcon,
              title: AppStrings.cosyAreas,
              selectedOption: state.filterOption,
              onTap: () {},
            ),
          ),
          PopupMenuItem(
            enabled: true,
            value: '',
            onTap: () => setFilterOption(AppStrings.price),
            child: FilterList(
              icon: SvgAssets.walletIcon,
              title: AppStrings.price,
              selectedOption: state.filterOption,
              onTap: () {},
            ),
          ),
          PopupMenuItem(
            enabled: true,
            value: '',
            onTap: () => setFilterOption(AppStrings.infrastructure),
            child: FilterList(
              icon: SvgAssets.basketIcon,
              title: AppStrings.infrastructure,
              selectedOption: state.filterOption,
              onTap: () {},
            ),
          ),
          PopupMenuItem(
            enabled: true,
            value: '',
            onTap: () => setFilterOption(AppStrings.withoutAnyLayer),
            child: FilterList(
              icon: SvgAssets.stackIcon,
              title: AppStrings.withoutAnyLayer,
              selectedOption: state.filterOption,
              onTap: () {},
            ),
          ),
        ],
      );

  Future<void> getNearbyApartmentDetails({
    required BuildContext context,
    required double lat,
    required double lgt,
  }) async {
    final nearbyDetails = await GooglePlaceApi().getApartmentsNearby(
      context: context,
      request: NearbyPlaceRequest(
        locationRestriction: LocationRestriction(
          circle: NearbyCircle(
            center: NearbyCenter(
              latitude: lat,
              longitude: lgt,
            ),
          ),
        ),
      ),
    );

    BitmapDescriptor customMarker =  await const CustomMapMarker()
        .toBitmapDescriptor(
      logicalSize: Size(100.aw, 100.ah),
      imageSize: Size(100.aw, 100.ah),
    );

   var apartmentMarkers = nearbyDetails?.places
        ?.map(
          (e)  => Marker(
            markerId: MarkerId(e.displayName?.text ?? ''),
            position: LatLng(
              e.location?.latitude ?? state.currentLocation!.latitude,
              e.location?.longitude ?? state.currentLocation!.longitude,
            ),
            infoWindow: InfoWindow(
              title: e.displayName?.text ?? '',
            ),
            icon:customMarker,
          ),
        )
        .toSet();

    final markers = state.mapMarkers.toSet()..addAll(apartmentMarkers ?? {});

    state = state.copyWith(
      mapMarkers: markers,
    );
  }
}
