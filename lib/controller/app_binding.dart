import 'package:fizz/app_imports.dart';
import 'package:fizz/controller/online_offline_controller.dart';
import 'package:fizz/view/intro_screens/forget_password/controller/forget_password_controller.dart';
import 'package:fizz/view/intro_screens/verification_screen/controller/verification_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateAccountController>(() => CreateAccountController(),
        fenix: true);
    Get.lazyPut<LocationController>(() => LocationController(), fenix: true);
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
    Get.lazyPut<ImagePickerController>(() => ImagePickerController(),
        fenix: true);
    Get.lazyPut<SettingsController>(() => SettingsController(), fenix: true);
    Get.lazyPut<LogoutController>(() => LogoutController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<OrderDetailsController>(() => OrderDetailsController(),
        fenix: true);
    Get.lazyPut<OrdersController>(() => OrdersController(), fenix: true);
    Get.lazyPut<AcceptOrderController>(() => AcceptOrderController(),
        fenix: true);
    Get.lazyPut<ChangeOrderStatusController>(
        () => ChangeOrderStatusController(),
        fenix: true);
    Get.lazyPut<DeleteAccountController>(() => DeleteAccountController(),
        fenix: true);
    Get.lazyPut<OnlineOfflineController>(() => OnlineOfflineController(),
        fenix: true);
    Get.lazyPut<ForgetPasswordController>(() => ForgetPasswordController(),
        fenix: true);
    Get.lazyPut<VerificationController>(() => VerificationController(),
        fenix: true);
  }
}
