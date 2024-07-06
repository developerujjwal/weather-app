
import 'package:http/http.dart';
import 'dart:convert';
class Network_Helper{
  Network_Helper(this.urll);
  final String urll;
  Future<dynamic> getdata()async{
    Response response = await get(Uri.parse(urll));

    String data = response.body;
    var jd= jsonDecode(data);
    print("status code: ");
    print(response.statusCode);
if(response.statusCode==200){
  return jsonDecode(data);
}
else{
  print(response.statusCode);
}

    var temperature_from_api=jd['main']['temp'];
    var coord_from_api=jd['coord']['lat'];
    var weather_from_api=jd['weather'][0]['description'];
    var weather_id=jd["weather"][0]["id"];
    var city_api= jd["name"];
    var country_name=jd["sys"]["country"];


  }
}
