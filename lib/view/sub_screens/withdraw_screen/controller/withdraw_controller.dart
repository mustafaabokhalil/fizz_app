import 'dart:developer';

import 'package:fizz/app_imports.dart';

enum WithDrawControllerStages { loading, error, done }

class WithDrawController extends GetxController {
  Rxn<WithDrawControllerStages> stages = Rxn<WithDrawControllerStages>();
  TextEditingController bankName = TextEditingController();
  TextEditingController bankOwnerName = TextEditingController();
  TextEditingController bankNumber = TextEditingController();
  TextEditingController iBANNumber = TextEditingController();
  TextEditingController amount = TextEditingController();
  void resetControllers(List<TextEditingController> controllers) {
    for (var controller in controllers) {
      controller.clear();
    }
  }

  Future<void> addWithdraw(context) async {
    try {
      stages.value = WithDrawControllerStages.loading;
      var headers = {
        'Accept': 'application/json',
        'Accept-Language': 'ar',
        'Authorization': 'Bearer ${LocalStorage.token}'
      };
      var request = MultipartRequest(
          'POST', Uri.parse('${ApiConstants.domain}/withdraw/create'));
      request.fields.addAll({
        'bank_name': bankName.text,
        'bank_owner_name': bankOwnerName.text,
        'bank_number': bankNumber.text,
        'IBAN': iBANNumber.text,
        'amount': amount.text,
      });
      request.headers.addAll(headers);

      StreamedResponse response = await request.send();
      final responseMap = await ApiConstants.getResponseMap(response);
      log(responseMap.toString());
      if (response.statusCode == 200) {
        resetControllers(
            [bankName, bankOwnerName, bankNumber, iBANNumber, amount]);

        AppFunctions.showSnackBar(
            context: context, message: responseMap['message']);
        Get.back();
        stages.value = WithDrawControllerStages.done;
      } else {
        AppFunctions.showErrorSnackBar(
          context: context,
          message: responseMap['message'],
        );
        stages.value = WithDrawControllerStages.error;
      }
    } catch (e) {
      stages.value = WithDrawControllerStages.error;
      debugPrint(e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
