import 'dart:developer';
import 'package:fizz/app_imports.dart';
import 'package:http/http.dart' as http;

class LogoutController extends GetxController {
  logout() async {
    var headers = {
      'Accept': 'application/json',
      'Accept-Language': Get.locale!.languageCode,
      'Authorization': 'Bearer ${LocalStorage.token}'
    };
    var request =
        http.Request('POST', Uri.parse('${ApiConstants.domain}/logout'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    final responseMap = await ApiConstants.getResponseMap(response);
    log(responseMap.toString());
    if (response.statusCode == 200 && responseMap['status'] == true) {
      LocalStorage.clearAllData();
      Get.offAll(() => const LoginScreen());
    } else {
      LocalStorage.clearAllData();
      Get.offAll(() => const LoginScreen());
    }
  }
}
