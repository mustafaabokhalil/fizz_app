import 'dart:developer';
import 'package:fizz/app_imports.dart';
import 'package:fizz/models/settings_model.dart';
import 'package:http/http.dart' as http;

enum SettingsControllerStage { loading, error, done }

class SettingsController extends GetxController {
  List<SettingsModel> settings = <SettingsModel>[].obs;
  Rxn<SettingsControllerStage> stages = Rxn<SettingsControllerStage>();
  Future getSupportedInfo() async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Accept-Language': Get.locale!.languageCode,
    };
    stages.value = SettingsControllerStage.loading;

    var request =
        http.Request('GET', Uri.parse('${ApiConstants.domain}/setting_data'));
    log('${ApiConstants.domain}/support');
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    final responseMap = await ApiConstants.getResponseMap(response);
    log('settings : ${responseMap}');
    if (response.statusCode == 200) {
      List<dynamic> jsonList = responseMap['data'];
      jsonList.forEach((element) {
        settings.add(SettingsModel.fromJson(element));
      });
      stages.value = SettingsControllerStage.done;
    } else {
      stages.value = SettingsControllerStage.error;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getSupportedInfo();
  }
}
