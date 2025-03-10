import 'dart:developer';

import 'package:fizz/app_imports.dart';
import 'package:fizz/view/intro_screens/verification_screen/controller/verification_controller.dart';

enum ResetPasswordControllerStages { loading, error, done }

class ResetPasswordController extends GetxController {
  RxBool isPasswordVisible = true.obs;
  Rxn<ResetPasswordControllerStages> stages =
      Rxn<ResetPasswordControllerStages>();
  final TextEditingController passwordController =
      TextEditingController(text: '');
  Future<void> resetPassword(context) async {
    try {
      stages.value = ResetPasswordControllerStages.loading;
      var headers = {
        'Accept': 'application/json',
        'Accept-Language': Get.locale!.languageCode,
        'Authorization': 'Bearer ${Get.find<VerificationController>().token}',
      };
      var request = MultipartRequest(
          'POST', Uri.parse('${ApiConstants.domain}/update_password'));
      request.fields.addAll({
        'password': passwordController.text,
      });

      request.headers.addAll(headers);

      StreamedResponse response = await request.send();
      final responseMap = await ApiConstants.getResponseMap(response);
      log(responseMap.toString());
      if (response.statusCode == 200) {
        AppFunctions.showSnackBar(
            snackBarPosition: SnackBarPosition.top,
            context: context,
            message: responseMap['message']);

        stages.value = ResetPasswordControllerStages.done;
        Get.off(() => LoginScreen());
      } else {
        AppFunctions.showErrorSnackBar(
            snackBarPosition: SnackBarPosition.top,
            context: context,
            message: responseMap['message']);
        stages.value = ResetPasswordControllerStages.error;
      }
    } catch (e) {
      AppFunctions.showErrorSnackBar(
          snackBarPosition: SnackBarPosition.top,
          context: context,
          message: e.toString());
      stages.value = ResetPasswordControllerStages.error;
    }
  }
}
