import 'package:geolocator/geolocator.dart';

class GeolocationServices{
  static Future<Position> getPosition()async{
    Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }
}