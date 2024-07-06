
import 'package:geolocator/geolocator.dart';

class Location{
   double? Latitude_number;
    double? Longitude_number;
  Future<void> getCurrentLocation()async{
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      Latitude_number = position.latitude;
      Longitude_number = position.longitude;
      print(position);
      print("location latitude: $Latitude_number");
      print("Location longitude: $Longitude_number");
    }
    catch(e){
      print(e);
    }
  }
}