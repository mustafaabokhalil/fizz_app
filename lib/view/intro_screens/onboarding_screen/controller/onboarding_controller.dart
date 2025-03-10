import 'dart:developer';

import 'package:fizz/app_imports.dart';
import 'package:fizz/helper/constants/api_constants.dart';
import 'package:fizz/models/onboarding_model.dart';

enum OnboardingControllerStages { loading, error, done }

class OnboardingController extends GetxController {
  RxList<OnboardingModel> onboardingList = <OnboardingModel>[].obs;
  Rxn<OnboardingControllerStages> stages = Rxn<OnboardingControllerStages>();
  RxInt onboaedingIndex = 0.obs;
  Future getOnboarding() async {
    stages.value = OnboardingControllerStages.loading;
    print('${ApiConstants.domain}/boarding');
    var headers = {
      'Accept': 'application/json',
      'Accept-Language': Get.locale!.languageCode,
    };
    var request = MultipartRequest(
      'GET',
      Uri.parse('${ApiConstants.domain}/boarding'),
    );
    print('${ApiConstants.domain}/boarding');
    request.headers.addAll(headers);

    StreamedResponse response = await request.send();
    final responseMap = await ApiConstants.getResponseMap(response);
    log(responseMap.toString());
    if (response.statusCode == 200) {
      List<dynamic> jsonList = responseMap['data'];
      jsonList.forEach((element) {
        onboardingList.add(OnboardingModel.fromJson(element));
      });
      stages.value = OnboardingControllerStages.done;
    } else {
      stages.value = OnboardingControllerStages.error;
    }
  }
}
