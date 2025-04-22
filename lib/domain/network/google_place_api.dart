import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moniepoint_assessment/domain/api_request/nearby_place_header.dart';
import 'package:moniepoint_assessment/domain/api_request/nearby_place_request.dart';
import 'package:moniepoint_assessment/domain/api_response/nearby_place_response.dart';
import 'package:moniepoint_assessment/widgets/utility_widgets/app_toast.dart';

class GooglePlaceApi {
  static const googlePlacesApi =
      'https://places.googleapis.com/v1/places:searchNearby';
  var client = http.Client();

  Future<NearbyPlaceResponse?> getApartmentsNearby({
    required BuildContext context,
    required NearbyPlaceRequest request,
  }) async {
    try {
      var response = await client.post(
        Uri.parse(googlePlacesApi),
        headers: NearbyPlaceHeader.placeHeader,
        body: jsonEncode(request.toJson()),
      );
      print('RESPONSE:::::${response.body}');

      if (response.statusCode == 200) {
        return NearbyPlaceResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        );
      }

      AppMessages.showErrorMessage(
        context: context,
        message: response.body,
      );
      return null;

    } catch (e) {
      print('Error:::::${e.toString()}');
      AppMessages.showErrorMessage(
        context: context,
        message: e.toString(),
      );
      return null;
    }
  }
}
