import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String flag;
  String url;
  String? time;
  bool? fetchData;
  bool? isDaytime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      // make the request
      Uri uri = Uri.http('worldtimeapi.org', '/api/timezone/$url');
      Response response = await get(uri);
      if (response.statusCode == 200) {
        fetchData = true;
        Map data = jsonDecode(response.body);
        String datetime = data['datetime'];
        String offset = data['utc_offset'].substring(1, 3);
        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(hours: int.parse(offset)));
        isDaytime = now.hour > 6 && now.hour < 19 ? true : false;
        time = DateFormat.jms().format(now);
      } else {
        fetchData = false;
      }
    } catch (e) {
      fetchData = false;
      time = 'Now time not could fetch !';
    }
  }
}
