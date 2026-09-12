class GeoCoordinates {
  final double latitude;
  final double longitude;

  GeoCoordinates(this.latitude, this.longitude);

  @override
  String toString() {
    return 'GeoCoordinates{latitude: $latitude, longitude: $longitude}';
  }
}
