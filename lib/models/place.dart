import 'dart:io';

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String adress;

  PlaceLocation(
    this.adress, {
    required this.latitude,
    required this.longitude,
  });
}

class Place {
  final String id;
  final String local;
  final PlaceLocation location;
  final File image;

  Place({
    required this.id,
    required this.local,
    required this.location,
    required this.image,
  });
}
