import 'dart:developer';

import 'package:fizz/app_imports.dart';

enum ContactUsControllerStages { loading, error, done }

class ContactUsController extends GetxController {
  Rxn<ContactUsControllerStages> stages = Rxn<ContactUsControllerStages>();

  TextEditingController message = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  Future<void> addContactUs(BuildContext context) async {
    if (phone.text.isEmpty) {
      AppFunctions.showSnackBar(
          context: context, message: "الرجاء إدخال رقم الهاتف");
      return;
    } else if (email.text.isEmpty) {
      AppFunctions.showSnackBar(
          context: context, message: "الرجاء إدخال البريد الإلكتروني");
      return;
    } else if (message.text.isEmpty) {
      AppFunctions.showSnackBar(
          context: context, message: "الرجاء إدخال الرسالة");
      return;
    }

    // If all validations pass, proceed with the request
    stages.value = ContactUsControllerStages.loading;
    var headers = {
      'Accept': 'application/json',
      'Accept-Language': 'en',
      'Authorization': 'Bearer ${LocalStorage.token}',
    };
    var request = MultipartRequest(
      'POST',
      Uri.parse('${ApiConstants.domain}/contact_to_admin'),
    );
    request.fields.addAll({
      'phone': phone.text,
      'email': email.text,
      'message': message.text,
    });

    request.headers.addAll(headers);

    StreamedResponse response = await request.send();
    final responseMap = await ApiConstants.getResponseMap(response);
    log(responseMap.toString());

    if (response.statusCode == 200) {
      stages.value = ContactUsControllerStages.done;
      AppFunctions.showSnackBar(
        context: context,
        message: responseMap['message'],
      );
      Get.back();
    } else {
      stages.value = ContactUsControllerStages.error;
      AppFunctions.showSnackBar(
        context: context,
        message: "حدث خطأ، يرجى المحاولة مرة أخرى",
      );
    }
  }
}
