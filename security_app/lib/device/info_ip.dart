import 'package:http/http.dart' as http;
import '../constent.dart';

class IpInfoApi {
  static Future<String?> getIpAdress() async {
    try {
      final url = Uri.parse(ipUrl);
      print(url);
      final res = await http.get(url);
      print(res.body);
      // ignore: unrelated_type_equality_checks
      return res.body;
    } catch (e) {
      return null;
    }
  }
}
