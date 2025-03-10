import 'package:fizz/app_imports.dart';

class SplashController extends GetxController {
  Future navigateToNextScreen() async {
    getCurrentLanguage();

    final localeStorage = await LocalStorage.readData('token');
    Timer(const Duration(seconds: 2), () {
      if (localeStorage != null) {
        LocalStorage.token = localeStorage;
        Get.to(() => NavigationScreen());
      } else {
        Get.to(() => const LoginScreen());
      }
    });
  }

  getCurrentLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    var lang = await prefs.getString('language');
    if (lang != null) {
      Get.updateLocale(Locale(lang.toString()));
    } else {
      Get.updateLocale(const Locale('ar'));
    }
  }

  @override
  void onInit() {
    super.onInit();
    navigateToNextScreen();
  }
}
