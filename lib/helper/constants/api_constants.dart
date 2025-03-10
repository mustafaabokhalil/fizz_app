import 'package:fizz/app_imports.dart';

class ApiConstants {
  static String domain = 'https://dashboard.fizz-logstic.com/api/v1/delivery';
  static Future getResponseMap(StreamedResponse response) async {
    var responseString = await response.stream.bytesToString();
    dynamic responseMap = json.decode(responseString);
    return responseMap;
  }

  static const String pusherKey = '719e0e77bb00581336ad';
  static const String pusherCluster = 'eu';
  static const String pusherSecret = '18e334b42207830d4af7';
  static const String pusherAppId = '1881433';
}
