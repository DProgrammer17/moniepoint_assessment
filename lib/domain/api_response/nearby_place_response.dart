class NearbyPlaceResponse {
  final List<Place>? places;

  NearbyPlaceResponse({
    this.places,
  });

  factory NearbyPlaceResponse.fromJson(Map<String, dynamic> json) =>
      NearbyPlaceResponse(
        places: json["places"] == null
            ? []
            : (json["places"] as List).map((e) => Place.fromJson(e)).toList(),
      );
}

class Place {
  final Location? location;
  final DisplayName? displayName;

  Place({
     this.location,
     this.displayName,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        location: Location.fromJson(json["location"]),
        displayName: DisplayName.fromJson(json["displayName"]),
      );
}

class DisplayName {
  final String? text;
  final String? languageCode;

  DisplayName({
     this.text,
     this.languageCode,
  });

  factory DisplayName.fromJson(Map<String, dynamic> json) => DisplayName(
        text: json["text"],
        languageCode: json["languageCode"],
      );
}

class Location {
  final double latitude;
  final double longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );
}
