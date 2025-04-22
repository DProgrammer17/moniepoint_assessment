import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapModel {
  final GoogleMapController? mapController;
  final Position? currentLocation;
  final TextEditingController mapTextController;
  final Set<Marker> mapMarkers;
  final String filterOption;

  const MapModel({
    required this.mapTextController,
    this.mapController,
    this.currentLocation,
    this.filterOption = '',
    this.mapMarkers = const {},
  });

  MapModel copyWith({
    TextEditingController? mapTextController,
    GoogleMapController? mapController,
    Position? currentLocation,
    Set<Marker>? mapMarkers,
    String? filterOption,
  }) {
    return MapModel(
      mapController: mapController ?? this.mapController,
      mapTextController: mapTextController ?? this.mapTextController,
      currentLocation: currentLocation ?? this.currentLocation,
      mapMarkers: mapMarkers ?? this.mapMarkers,
      filterOption: filterOption ?? this.filterOption,
    );
  }
}
