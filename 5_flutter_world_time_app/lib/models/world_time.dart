import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class WorldTime {
  String url;
  late List splited = url.split('/');
  late String region = splited[splited.length - 2];
  late String location =
      splited[splited.length - 1].replaceAll(RegExp(r'_'), ' ');
  late String time;
  late String bg;
  WorldTime({required this.url});
  WorldTime.empty({required this.url}) {
    url = "url";
    region = "region";
    location = "location";
    time = "time";
    bg = "bg1.jpg";
  }

  Future<void> getTime() async {
    try {
      final response = await http.get(
        Uri.parse('https://www.timeapi.io/api/Time/current/zone?timeZone=$url'),
      );
      Map data = convert.jsonDecode(response.body);
      String hour = data['hour'].toString().length != 1
          ? data['hour'].toString()
          : '0${data['hour'].toString()}';
      String minute = data['minute'].toString().length != 1
          ? data['minute'].toString()
          : '0${data['minute'].toString()}';
      String seconds = data['seconds'].toString().length != 1
          ? data['seconds'].toString()
          : '0${data['seconds'].toString()}';

      time = '$hour:$minute:$seconds';
      if (data['hour'] >= 6 && data['hour'] < 12) {
        bg = "bg1.jpg";
      } else if (data['hour'] >= 12 && data['hour'] < 17) {
        bg = "bg2.jpg";
      } else if (data['hour'] >= 17 && data['hour'] < 20) {
        bg = "bg3.jpg";
      } else {
        bg = "bg4.jpg";
      }
    } catch (e) {
      time = 'error';
      bg = 'bg1.jpg';
    }
  }
}
