import 'dart:io';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:fizz/app_imports.dart';
import 'package:fizz/view/navigation_screens/navigation_screen/controller/navigation_screen_controller.dart';

class NavigationScreen extends StatefulWidget {
  NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NavBarController(),
      builder: (controller) => WillPopScope(
        onWillPop: AppFunctions.showExitPopup,
        child: Scaffold(
          body: controller.mainscreens[controller.currentPageIndex],
          bottomNavigationBar: SizedBox(
            height: Platform.isIOS ? 70.h : 50.h,
            child: ConvexAppBar(
              height: 50.h,
              activeColor: AppColors.primaryColor,
              backgroundColor: Colors.white,
              style: TabStyle.reactCircle,
              top: -8.h,
              items: [
                TabItem(
                  activeIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      AppAssets.home,
                      height: 30.h,
                    ),
                  ),
                  icon: Image.asset(
                    AppAssets.home,
                  ),
                ),
                TabItem(
                  isIconBlend: false,
                  activeIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      AppAssets.wallet,
                    ),
                  ),
                  icon: Image.asset(
                    AppAssets.wallet,
                    height: 40.h,
                  ),
                ),
                TabItem(
                    activeIcon: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Image.asset(
                        AppAssets.orders,
                        height: 30.h,
                        width: 35.w,
                      ),
                    ),
                    icon: Image.asset(AppAssets.orders)),
                TabItem(
                    activeIcon: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                        AppAssets.user,
                        height: 40.h,
                      ),
                    ),
                    icon: Image.asset(
                      AppAssets.user,
                    )),
              ],
              initialActiveIndex: 0,
              onTap: (int i) {
                controller.changeCurrentPageIndex(i);
                if (i == 2) {
                  Get.find<OrdersController>().getOrders();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
