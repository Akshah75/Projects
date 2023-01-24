import 'dart:convert';
import 'package:security_app/Authentication/registerjsondata.dart';
import 'package:security_app/image_upload/image.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constent.dart';
import '../Authentication/user_data.dart';
import '../Authentication/api_response.dart';
import 'package:http/http.dart' as http;

//

Future<ApiResponse> getUserDetail(String email, String password) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    print(token);
    final response = await http.post(Uri.parse('${basedUrl}login'), headers: {
      'Accept': 'application/json'
    }, body: {
      "email": email,
      "password": password,
    });
    //

    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        print(apiResponse.data);
        break;
      case 401:
        final passwordError = jsonDecode(response.body)['message'];
        print(passwordError);
        apiResponse.error = passwordError;
        print(apiResponse.error);
        break;
      default:
        apiResponse.error = 'something went wrong';
    }
  } catch (e) {
    apiResponse.error = 'server error';
  }
  return apiResponse;
}

//////////////get token//////////////\
Future<String> getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('token') ?? '';
}

Future<int> getId() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getInt('id') ?? 0;
}

Future<String> getname() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString("name") ?? '';
}

Future<String> getAddress() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString("address") ?? '';
}

Future<String> getEmail() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString("email") ?? '';
}

Future<int> getUserType() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getInt("user_type") ?? 0;
}

Future<int> getmobile() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getInt("mobile") ?? 0;
}

////////////log out/////////
Future<bool> logout() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return await pref.remove('token');
}

////////////////////////////////////////////////////////////////////////////////
//registre//
Future<ApiResponse> getUserRegistreDetail(String name, String mobile,
    String email, String address, String password) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    print(token);
    final response =
        await http.post(Uri.parse('${basedUrl}registre'), headers: {
      'Accept': 'application/json'
    }, body: {
      "name": name,
      "mobile": mobile,
      "email": email,
      "address": address,
      "password": password,
    });
    //

    switch (response.statusCode) {
      case 200:
        apiResponse.data =
            UserDetailForRegistration.fromJson(jsonDecode(response.body));
        print(apiResponse.data);
        break;
      case 422:
        final emailError = jsonDecode(response.body)['message'];
        apiResponse.error == emailError;
        print(emailError);
        print(apiResponse.error);
        break;
      default:
        apiResponse.error = 'something went wrong';
    }
  } catch (e) {
    apiResponse.error = 'server error';
  }
  return apiResponse;
}
