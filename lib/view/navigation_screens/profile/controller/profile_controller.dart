import 'dart:developer';

import 'package:fizz/app_imports.dart';
import 'package:fizz/models/user_model.dart';

enum ProfileControllerStates { loading, error, done }

class ProfileController extends GetxController {
  Rxn<ProfileControllerStates> getProfileDataStates =
      Rxn<ProfileControllerStates>();
  Rxn<UserModel> user = Rxn<UserModel>();
  RxBool isOnline = false.obs;
  getProfileData() async {
    getProfileDataStates.value = ProfileControllerStates.loading;
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${LocalStorage.token}'
    };
    var request = Request(
      'GET',
      Uri.parse(
        '${ApiConstants.domain}/get_profile',
      ),
    );

    request.headers.addAll(headers);

    StreamedResponse response = await request.send();
    final responseMap = await ApiConstants.getResponseMap(response);
    log(responseMap.toString());
    if (response.statusCode == 200) {
      user.value = UserModel.fromJson(responseMap['data']);
      if (user.value != null) {
        isOnline.value = user.value!.available == 0 ? false : true;
      }
      getProfileDataStates.value = ProfileControllerStates.done;
    } else {
      getProfileDataStates.value = ProfileControllerStates.error;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getProfileData();
  }
}
