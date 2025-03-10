import 'dart:developer';

import 'package:fizz/app_imports.dart';
import 'package:fizz/models/notification_model.dart';

enum notificationsControllerStages { loading, error, done }

class NotificationsController extends GetxController {
  Rxn<notificationsControllerStages> notificationsStages =
      Rxn<notificationsControllerStages>();
  Rxn<NotificationResponse> notificationResponse = Rxn<NotificationResponse>();
  Future<void> getNotification() async {
    notificationsStages.value = notificationsControllerStages.loading;
    var headers = {
      'Accept': 'application/json',
      'Accept-Language': 'ar',
      'Authorization': 'Bearer ${LocalStorage.token}'
    };
    var request = Request(
        'GET',
        Uri.parse(
          '${ApiConstants.domain}/notifications',
        ));
    request.headers.addAll(headers);
    StreamedResponse response = await request.send();
    final responseMap = await ApiConstants.getResponseMap(response);
    log(responseMap.toString());
    if (response.statusCode == 200) {
      notificationResponse.value = NotificationResponse.fromJson(responseMap);
      notificationsStages.value = notificationsControllerStages.done;
    } else {
      notificationsStages.value = notificationsControllerStages.error;
    }
  }

  @override
  void onInit() {
    getNotification();
    super.onInit();
  }
}
