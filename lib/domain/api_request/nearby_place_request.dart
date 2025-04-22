class NearbyPlaceRequest {
  final LocationRestriction locationRestriction;

  NearbyPlaceRequest({
    required this.locationRestriction,
  });

  Map<String, dynamic> toJson() => {
    "includedTypes": ["hotel"],
    "maxResultCount": 20,
    "locationRestriction": locationRestriction.toJson(),
  };
}

class LocationRestriction {
  final NearbyCircle circle;

  LocationRestriction({
    required this.circle,
  });

  Map<String, dynamic> toJson() => {
    "circle": circle.toJson(),
  };
}

class NearbyCircle {
  final NearbyCenter center;

  NearbyCircle({
    required this.center,
  });

  Map<String, dynamic> toJson() => {
    "center": center.toJson(),
    "radius": 500,
  };
}

class NearbyCenter {
  final double latitude;
  final double longitude;

  NearbyCenter({
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}
