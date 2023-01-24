import 'dart:convert';

import 'package:event_app/ApiModals/event_api.dart';
import 'package:http/http.dart' as http;

import 'main/main_api_modal.dart';

const basedUrl =
    'https://youtoocanrun.com/wp-content/uploads/espresso/dashboard/races_admin/api/';

class RemoteServices {
  static final client = http.Client();

  static Future<List<Event>?> fetchEvent() async {
    final url = Uri.parse(basedUrl + "total_collection.php");
    final response = await client.get(url);

    if (response.statusCode == 200) {
      print("ok");
      print(response.body);
      final jsonData = response.body;
      return eventFromJson(jsonData);
    } else {
      print("somthing wrong");
      return null;
    }
  }

//
  static Future<dynamic> fetchUser(Object object) async {
    final url = Uri.parse(basedUrl + "user_notification.php");
    var header = {"accept": "application/json"};
    var body = jsonEncode(object);
    var response = await client.post(url, headers: header, body: body);
    // final res = jsonDecode(response.body);

    final res = json.decode(response.body);
    return EventData.fromJson(res);
  }
}
