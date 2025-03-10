import 'dart:developer';
import 'package:fizz/app_imports.dart';
import 'package:fizz/models/cities_model.dart';

import 'package:http/http.dart' as http;

enum CitiesControllerStages { loading, error, done }

class CitiesController extends GetxController {
  Rxn<CityResponse> citiesResponse = Rxn<CityResponse>();
  Rxn<CitiesControllerStages> stages = Rxn<CitiesControllerStages>();
  Future getCities() async {
    var headers = {
      'Accept': 'application/json',
      'Accept-Language': Get.locale!.languageCode,
    };
    stages.value = CitiesControllerStages.loading;

    var request = http.Request('GET', Uri.parse('${ApiConstants.domain}/city'));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    final responseMap = await ApiConstants.getResponseMap(response);
    log('city : ${responseMap}');
    if (response.statusCode == 200) {
      citiesResponse.value = CityResponse.fromJson(responseMap);
      stages.value = CitiesControllerStages.done;
    } else {
      stages.value = CitiesControllerStages.error;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getCities();
  }
}
