import 'dart:async';
import 'dart:core';
import 'package:location/location.dart';
import './location_modal.dart';

//

late UserLocation _currentLocation;

Location location = Location();
//
StreamController<UserLocation> locationController =
    StreamController<UserLocation>.broadcast();

//
LocationService() {
  location.requestPermission().then((granted) {
    if (granted == null) {
      location.onLocationChanged.listen((locationData) {
        if (locationData != null) {
          locationController.add(UserLocation(
              latitude: locationData.latitude!.toDouble(),
              longitude: locationData.longitude!.toDouble()));
        }
      });
    }
  });
}

//
Stream<UserLocation> get locationStrem => locationController.stream;

Future<UserLocation> getUserLocation() async {
  try {
    var userLocation = await location.getLocation();
    _currentLocation = UserLocation(
        latitude: userLocation.latitude!.toDouble(),
        longitude: userLocation.longitude!.toDouble());
  } catch (e) {
    print("cound not print erro");
  }
  return _currentLocation;
}
