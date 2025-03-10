import 'package:fizz/app_imports.dart';

enum VerificationControllerStages { loading, error, done }

class VerificationController extends GetxController {
  RxString forgetPasswordOtp = ''.obs;
  RxString selectedOtp = ''.obs;
  RxString token = ''.obs;
  void verificationOtp() {}
}
