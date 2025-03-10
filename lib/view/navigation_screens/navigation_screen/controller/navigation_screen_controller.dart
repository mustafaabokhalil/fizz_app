import 'package:fizz/app_imports.dart';
import 'package:fizz/view/navigation_screens/home/screen/home_screen.dart';
import 'package:fizz/view/navigation_screens/orders_screen/screen/orders_screen.dart';
import 'package:fizz/view/navigation_screens/profile/screen/profile_screen.dart';
import 'package:fizz/view/navigation_screens/wallet/screen/wallet_screen.dart';

class NavBarController extends GetxController {
  List<Widget> mainscreens = const [
    HomeScreen(),
    WalletScreen(),
    OrdersScreen(),
    ProfileScreen(),
  ];
  int currentPageIndex = 0;

  changeCurrentPageIndex(int val) {
    currentPageIndex = val;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
