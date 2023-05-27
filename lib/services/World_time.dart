import 'package:http/http.dart';
import 'dart:convert' as convert;
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  String time=''; // time in that location
  String flag; // url to an asset flags
  String url;  // api and point
  bool isDayTime = true;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      var apiendpoint = Uri.https('worldtimeapi.org',
          '/api/timezone/$url',
          {'q': '{http}'});
      Response res = await get(apiendpoint);
      print(res.statusCode);
      print(res.body);
      if (res.statusCode == 200) {
        var data = convert.jsonDecode(res.body) as Map<String, dynamic>;
        // print(data);
        String datetime = data['datetime'];
        bool isPositive = data['utc_offset'].substring(0,1) == '+' ? true: false;
        String offset = data['utc_offset'].substring(1,3);
        // print('${datetime} - ${offset}');

        //create date time obj
        DateTime now = DateTime.parse(datetime);
        int dur = isPositive ? int.parse(offset) : int.parse(offset) * (-1);
        now = now.add(Duration(hours: dur));
        // print('${now}');
        // set time prop
        // time = now.toString();
        time = DateFormat.jm().format(now);
        isDayTime = now.hour > 6 && now.hour < 20 ? true:false;
      }else{
        time = 'Unknown';
        isDayTime = true;
      }
    } catch(e) {
      time = 'Unable to get time';
      isDayTime = true;
      print('Failed $e');
    }
  }
}
