import 'dart:developer';
import 'package:fizz/app_imports.dart';

enum LoginStates { loading, error, done }

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController(text: '');
  //delivery@delivery.com
  //123
  final TextEditingController passwordController =
      TextEditingController(text: '');
  RxBool isPasswordVisible = true.obs;
  Rxn<LoginStates> loginStates = Rxn<LoginStates>();
  login(context) async {
    loginStates.value = LoginStates.loading;
    try {
      // const String fcm = '';
      var headers = {
        'Accept': 'application/json',
        'Accept-Language': Get.locale!.languageCode,
      };
      var request =
          MultipartRequest('POST', Uri.parse('${ApiConstants.domain}/login'));
      request.fields.addAll({
        'email': emailController.text,
        'password': passwordController.text,
        'fcm': FirebaseMessagingService.instance.fcmToken.toString()
      });

      request.headers.addAll(headers);

      StreamedResponse response = await request.send();

      final responseMap = await ApiConstants.getResponseMap(response);

      log(responseMap.toString());
      if (response.statusCode == 200 && responseMap['status'] == true) {
        LocalStorage.saveData('token', responseMap['token']);
        LocalStorage.token = await LocalStorage.readData('token');
        Timer(const Duration(seconds: 1), () {
          Get.to(() => NavigationScreen());
        });

        loginStates.value = LoginStates.done;
      } else if (response.statusCode == 400) {
        // Get.find<VerificationController>().token.value = responseMap['token'];

        AppFunctions.showErrorSnackBar(
            snackBarPosition: SnackBarPosition.top,
            context: context,
            message: responseMap['message']);
        Timer(const Duration(seconds: 1), () {
          // Get.to(() => const VerificationScreen());
        });
        loginStates.value = LoginStates.error;
      } else {
        AppFunctions.showErrorSnackBar(
            snackBarPosition: SnackBarPosition.top,
            context: context,
            message: responseMap['message']);
        loginStates.value = LoginStates.error;
      }
    } catch (e) {
      debugPrint(e.toString());
      loginStates.value = LoginStates.error;
    }
  }
}
