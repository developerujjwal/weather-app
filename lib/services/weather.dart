import 'package:weather_forecast_and_current_location/location.dart';
import 'package:weather_forecast_and_current_location/services/location.dart';

const apiidd="af66f72d821d122b97e4d80e5249a27f";

class Weathermodel{

  Future<dynamic> Current_Location_Live()async{
    Location l =   new Location();
    await l.getCurrentLocation();

//get_Data_from_api();
    Network_Helper network_helper = new Network_Helper('https://api.openweathermap.org/data/2.5/weather?lat=${l.Latitude_number}&lon=${l.Longitude_number}&appid=$apiidd&units=metric');

    var weather_Data=await network_helper.getdata();
return weather_Data;
  }


  String getweathericon(int condition){
        if(condition<300){
          return '🌩';
        }
        else if(condition<400){
          return '🌧';
        }
        else if(condition<600){
          return '☔️';
        }
        else if(condition<700)
          {
            return '☃️';
          }
        else if(condition<800){
          return '🌫';
        }
        else if(condition==800){
          return '☀';
        }
        else if(condition <=804){
          return '☁️';
        }
        else{
          return '🤷‍';
        }
  }

  String messageget(int temperatu){
    if(temperatu>25){
      return 'It\'s 🍦 time';
    }
    else if(temperatu>20){
      return 'Time for shorts and 👕';
    }
    else if(temperatu<10){
      return 'You\'ll need 🧣 and 🧤';
    }
    else{
      return 'Bring a 🧥 just in case';

    }
  }
}