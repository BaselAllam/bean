import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:scoped_model/scoped_model.dart';



mixin MapController on Model{

  bool _isGetCurrentPositionLoading = false;
  bool get isGetCurrentPositionLoading => _isGetCurrentPositionLoading;

  bool _isGetSearchLocationLoading = false;
  bool get isGetSearchLocationLoading => _isGetSearchLocationLoading;

  Position? position;

  Set<Marker> allMarkers = {};

  getCurrentPosition() async {

    _isGetCurrentPositionLoading = true;
    notifyListeners();

    Position _currentPosition = await Geolocator.getCurrentPosition();
    position = _currentPosition;

    Marker _newMarker = Marker(
      markerId: MarkerId('1'),
      position: LatLng(_currentPosition.latitude, _currentPosition.longitude)
    );

    allMarkers.add(_newMarker);

    _isGetCurrentPositionLoading = false;
    notifyListeners();    
  }


  searchLocation(String location) async {

    _isGetSearchLocationLoading = true;
    notifyListeners();
    
    List<Location> locations = await locationFromAddress("$location");

    position = Position(latitude: locations[0].latitude, longitude: locations[0].longitude, accuracy: 12.0, isMocked: true, altitude: 0.0, heading: 0.0, speed: 0.0, speedAccuracy: 0.0, floor: 1, timestamp: DateTime.now());

    Marker _newMarker = Marker(
      markerId: MarkerId('1'),
      position: LatLng(locations[0].latitude, locations[0].longitude)
    );

    allMarkers.add(_newMarker);

    _isGetSearchLocationLoading = false;
    notifyListeners();
  }
}