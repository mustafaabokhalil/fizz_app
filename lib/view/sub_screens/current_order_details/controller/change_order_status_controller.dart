import 'dart:developer';

import 'package:fizz/app_imports.dart';

enum ChangeOrderStatusControllerStatus { loading, error, done }

class ChangeOrderStatusController extends GetxController {
  Rxn<OrderStatusModel> selectedOrderStatus = Rxn<OrderStatusModel>();

  Rxn<ChangeOrderStatusControllerStatus> trackingStates =
      Rxn<ChangeOrderStatusControllerStatus>();
  Future<void> changeOrderStatus({
    required context,
  }) async {
    try {
      trackingStates.value = ChangeOrderStatusControllerStatus.loading;
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${LocalStorage.token}',
      };
      var request = MultipartRequest(
          'POST', Uri.parse('${ApiConstants.domain}/order/change_status'));
      request.fields.addAll({
        'order_id': Get.find<OrderDetailsController>()
            .orderDetails
            .value!
            .id
            .toString(),
        'delivery_status': selectedOrderStatus.value!.id.toString()
      });

      request.headers.addAll(headers);

      StreamedResponse response = await request.send();
      final resposeMap = await ApiConstants.getResponseMap(response);
      log(resposeMap.toString());
      if (response.statusCode == 200) {
        Get.find<OrdersController>().getOrders();
        Get.back();
        trackingStates.value = ChangeOrderStatusControllerStatus.done;
      } else {
        trackingStates.value = ChangeOrderStatusControllerStatus.error;
      }
    } catch (e) {
      trackingStates.value = ChangeOrderStatusControllerStatus.error;

      print(e);
    }
  }
}
