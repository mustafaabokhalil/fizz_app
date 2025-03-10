import 'dart:developer';

import 'package:fizz/app_imports.dart';
import 'package:fizz/models/pusher_order_model.dart';
import 'package:fizz/models/all_orders_model.dart';

enum OrdersControllerStages { loading, error, done }

class OrdersController extends GetxController {
  Rxn<OrdersControllerStages> stages = Rxn<OrdersControllerStages>();
  List<PusherOrder> pusherOrders = <PusherOrder>[].obs;
  Rxn<AllOrdersModel> allOrders = Rxn<AllOrdersModel>();
  Future<void> getOrders() async {
    try {
      stages.value = OrdersControllerStages.loading;
      var headers = {
        'Accept': 'application/json',
        'Accept-Language': 'ar',
        'Authorization': 'Bearer ${LocalStorage.token}'
      };
      var request =
          MultipartRequest('GET', Uri.parse('${ApiConstants.domain}/orders'));

      request.headers.addAll(headers);

      StreamedResponse response = await request.send();
      final responseMap = await ApiConstants.getResponseMap(response);
      log(responseMap.toString());
      if (response.statusCode == 200 && responseMap['status'] == true) {
        allOrders.value = AllOrdersModel.fromJson(responseMap);
        stages.value = OrdersControllerStages.done;
      } else {
        stages.value = OrdersControllerStages.error;
      }
    } catch (e) {
      stages.value = OrdersControllerStages.error;
      print(e);
    }
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
