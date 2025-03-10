import 'dart:developer';

import 'package:fizz/app_imports.dart';
import 'package:fizz/models/order_details_model.dart';

enum OrderDetailsControllerStages { Loading, error, done }

class OrderDetailsController extends GetxController {
  Rxn<OrderDetailsControllerStages> stages =
      Rxn<OrderDetailsControllerStages>();
  Rxn<OrderDetailsData> orderDetails = Rxn<OrderDetailsData>();
  Future<void> getOrderDetails(orderId) async {
    try {
      stages.value = OrderDetailsControllerStages.Loading;
      orderDetails.value = null;
      var headers = {
        'Accept': 'application/json',
        'Accept-Language': 'ar',
        'Authorization': 'Bearer ${LocalStorage.token}'
      };
      var request = MultipartRequest(
          'GET',
          Uri.parse(
              '${ApiConstants.domain}/order/details?order_id=${orderId}'));

      request.headers.addAll(headers);

      StreamedResponse response = await request.send();
      final responseMap = await ApiConstants.getResponseMap(response);
      log(responseMap.toString());
      if (response.statusCode == 200 && responseMap['status'] == true) {
        orderDetails.value = OrderDetailsData.fromJson(responseMap['data']);
        stages.value = OrderDetailsControllerStages.done;
      } else {
        stages.value = OrderDetailsControllerStages.error;
      }
    } catch (e) {
      stages.value = OrderDetailsControllerStages.error;

      print(e);
    }
  }
}
