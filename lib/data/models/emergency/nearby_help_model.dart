import 'dart:math';

class NearbyHelpModel {
  const NearbyHelpModel({
    required this.name,
    required this.type,
    required this.distance,
    required this.latitude,
    required this.longitude,
    this.countryCode,
    this.address,
    this.rating,
    this.placeId,
    this.routeDistance,
    this.routeDuration,
    this.encodedPolyline,
    this.travelMode = 'driving',
    this.liveSpeedKmh = 0,
  });

  final String name;
  final String type;
  final String distance;
  final double latitude;
  final double longitude;
  final String? countryCode;
  final String? address;
  final double? rating;
  final String? placeId;
  final String? routeDistance;
  final String? routeDuration;
  final String? encodedPolyline;
  final String travelMode;
  final double liveSpeedKmh;

  NearbyHelpModel copyWith({
    String? name,
    String? type,
    String? distance,
    double? latitude,
    double? longitude,
    String? countryCode,
    String? address,
    double? rating,
    String? placeId,
    String? routeDistance,
    String? routeDuration,
    String? encodedPolyline,
    String? travelMode,
    double? liveSpeedKmh,
  }) {
    return NearbyHelpModel(
      name: name ?? this.name,
      type: type ?? this.type,
      distance: distance ?? this.distance,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      countryCode: countryCode ?? this.countryCode,
      address: address ?? this.address,
      rating: rating ?? this.rating,
      placeId: placeId ?? this.placeId,
      routeDistance: routeDistance ?? this.routeDistance,
      routeDuration: routeDuration ?? this.routeDuration,
      encodedPolyline: encodedPolyline ?? this.encodedPolyline,
      travelMode: travelMode ?? this.travelMode,
      liveSpeedKmh: liveSpeedKmh ?? this.liveSpeedKmh,
    );
  }

  double calculateDistanceFrom(double currentLat, double currentLng) {
    const double earthRadius = 6371; // in kilometers
    final double dLat = (latitude - currentLat) * (pi / 180);
    final double dLng = (longitude - currentLng) * (pi / 180);
    final double currentLatRadians = currentLat * (pi / 180);
    final double facilityLatRadians = latitude * (pi / 180);
    final double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(currentLatRadians) *
            cos(facilityLatRadians) *
            sin(dLng / 2) *
            sin(dLng / 2);
    return earthRadius * 2 * asin(sqrt(a));
  }

  String getFormattedDistance(double currentLat, double currentLng) {
    final double distanceKm = calculateDistanceFrom(currentLat, currentLng);
    if (distanceKm < 1) {
      return '${(distanceKm * 1000).round()} m';
    }
    return '${distanceKm.toStringAsFixed(1)} km';
  }
}
