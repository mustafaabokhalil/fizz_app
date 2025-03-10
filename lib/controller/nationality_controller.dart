import 'dart:developer';
import 'package:fizz/app_imports.dart';
import 'package:fizz/models/cities_model.dart';
import 'package:fizz/models/nationality_model.dart';

import 'package:http/http.dart' as http;

enum NationalityControllerStages { loading, error, done }

class NationalityController extends GetxController {
  Rxn<NationalityResponse> citiesResponse = Rxn<NationalityResponse>();
  Rxn<NationalityControllerStages> stages = Rxn<NationalityControllerStages>();
  Future getCities() async {
    var headers = {
      'Accept': 'application/json',
      'Accept-Language': Get.locale!.languageCode,
    };
    stages.value = NationalityControllerStages.loading;

    var request =
        http.Request('GET', Uri.parse('${ApiConstants.domain}/nationality'));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    final responseMap = await ApiConstants.getResponseMap(response);
    log('city : ${responseMap}');
    if (response.statusCode == 200) {
      citiesResponse.value = NationalityResponse.fromJson(responseMap);
      stages.value = NationalityControllerStages.done;
    } else {
      stages.value = NationalityControllerStages.error;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getCities();
  }
}
