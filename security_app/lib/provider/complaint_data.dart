//
import 'dart:convert';

import 'package:security_app/Authentication/api_response.dart';
import 'package:security_app/constent.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Authentication/login_data.dart';
import 'complaint_data_modal.dart';

Future<ApiResponse> getcomplaintDetail() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final url = Uri.parse('${basedUrl}complaint');
    final res = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    switch (res.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(res.body)['data']
            .map((p) => GetComplaintData.fromJson(p))
            .toList();
        apiResponse.data as List<dynamic>;
        print(apiResponse.data);
        break;
      default:
        apiResponse.error = 'something went wrong';
    }
  } catch (e) {
    apiResponse.error = 'server error';
  }
  return apiResponse;
}

Future<String> getfname() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString("firstname") ?? '';
}
