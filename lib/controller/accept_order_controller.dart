import 'dart:developer';

import 'package:fizz/app_imports.dart';
import 'package:fizz/view/navigation_screens/navigation_screen/controller/navigation_screen_controller.dart';

enum AcceptOrderControllerStages { loading, error, done }

class AcceptOrderController extends GetxController {
  Rxn<AcceptOrderControllerStages> stages = Rxn<AcceptOrderControllerStages>();
  Future<void> acceptOrder({required orderId, required context}) async {
    try {
      stages.value = AcceptOrderControllerStages.loading;
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${LocalStorage.token}'
      };
      var request = MultipartRequest(
          'POST', Uri.parse('${ApiConstants.domain}/order/accept'));
      request.fields.addAll({'order_id': '$orderId'});

      request.headers.addAll(headers);

      StreamedResponse response = await request.send();
      final responseMap = await ApiConstants.getResponseMap(response);
      log(responseMap.toString());
      if (response.statusCode == 200 && responseMap['status'] == true) {
        stages.value = AcceptOrderControllerStages.done;
        AppFunctions.showSnackBar(
            context: context, message: responseMap['message']);
        Timer(Duration(milliseconds: 500), () {
          Get.find<OrdersController>().getOrders();
          Get.find<NavBarController>().changeCurrentPageIndex(2);
          Get.to(() => NavigationScreen());
        });
      } else {
        stages.value = AcceptOrderControllerStages.error;
        AppFunctions.showSnackBar(
            context: context, message: responseMap['message']);
      }
    } catch (e) {
      stages.value = AcceptOrderControllerStages.error;
      print(e);
    }
  }
}
