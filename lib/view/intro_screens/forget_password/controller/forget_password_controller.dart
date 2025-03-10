import 'dart:developer';

import 'package:fizz/app_imports.dart';
import 'package:fizz/view/intro_screens/verification_screen/controller/verification_controller.dart';
import 'package:fizz/view/intro_screens/verification_screen/screen/verification_screen.dart';

enum ForgetPasswordControllerStages { Loading, Error, Done }

class ForgetPasswordController extends GetxController {
  Rxn<ForgetPasswordControllerStages> states =
      Rxn<ForgetPasswordControllerStages>();
  TextEditingController emailController = TextEditingController();
  Future forgetPassword(context) async {
    try {
      states.value = ForgetPasswordControllerStages.Loading;
      var headers = {
        'Accept': 'application/json',
        'Accept-Language': Get.locale!.languageCode,
      };
      var request = MultipartRequest(
          'POST', Uri.parse('${ApiConstants.domain}/forget_password'));
      request.fields.addAll({
        'email': emailController.text,
      });

      request.headers.addAll(headers);

      StreamedResponse response = await request.send();
      final responseMap = await ApiConstants.getResponseMap(response);
      log(responseMap.toString());
      if (response.statusCode == 200) {
        Get.find<VerificationController>().forgetPasswordOtp.value =
            responseMap['data']['otp'].toString();
        Get.find<VerificationController>().token.value =
            responseMap['data']['token'].toString();
        AppFunctions.showSnackBar(
            snackBarPosition: SnackBarPosition.top,
            context: context,
            message: responseMap['message']);
        Timer(const Duration(seconds: 1), () {
          Get.to(() => const VerificationScreen());
        });
        states.value = ForgetPasswordControllerStages.Done;
      } else {
        AppFunctions.showErrorSnackBar(
            snackBarPosition: SnackBarPosition.top,
            context: context,
            message: responseMap['message']);
        states.value = ForgetPasswordControllerStages.Error;
      }
    } catch (e) {
      AppFunctions.showErrorSnackBar(
          snackBarPosition: SnackBarPosition.top,
          context: context,
          message: e.toString());
      states.value = ForgetPasswordControllerStages.Error;
    }
  }
}
