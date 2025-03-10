import 'package:fizz/app_imports.dart';
import 'package:fizz/view/navigation_screens/orders_screen/controller/orders_controller.dart';
import 'package:fizz/view/navigation_screens/orders_screen/widgets/current_orders_widget.dart';
import 'package:fizz/view/navigation_screens/orders_screen/widgets/previous_orders_widget.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _OrdersScreenScaffoldKey =
        GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _OrdersScreenScaffoldKey,
      drawer: DrawerWidget(),
      body: Stack(
        children: [
          Positioned(
              top: 0.0,
              right: 0.0,
              child: Image.asset(
                AppAssets.splashTopShape,
                width: 1.sw,
              )),
          DefaultTabController(
            length: 2,
            child: GetBuilder(
              init: OrdersController(),
              builder: (controller) => CustomScrollView(
                physics: NeverScrollableScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    toolbarHeight: 60.h,
                    backgroundColor: Colors.transparent,
                    leading: Transform.scale(
                      scale: 0.5,
                      child: InkWell(
                        onTap: () {
                          _OrdersScreenScaffoldKey.currentState!.openDrawer();
                        },
                        child: Image.asset(
                          AppAssets.menu,
                        ),
                      ),
                    ),
                    centerTitle: true,
                    title: Text(
                      'الطلبات',
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    actions: [
                      SizedBox(
                        width: 12.w,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => const NotificationScreen());
                        },
                        child: Image.asset(
                          AppAssets.notifications,
                          width: 25.w,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      )
                    ],
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40.h,
                          child: TabBar(
                            padding: EdgeInsets.zero,
                            indicator: BoxDecoration(), // Removes the underline
                            labelColor: AppColors.secondaryColor,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: AppFonts.tajawalExtraBold,
                              fontSize: 14.sp,
                            ),
                            unselectedLabelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: AppFonts.tajawalExtraBold,
                              fontSize: 14.sp,
                            ),
                            // Color of the active tab label
                            unselectedLabelColor:
                                Colors.grey, // Color of inactive tab labels
                            tabs: const [
                              Tab(text: 'الطلبات الحالية'),
                              Tab(text: 'الطلبات المنتهية'),
                            ],
                          ),
                        ),
                        // Remove AppBar shadow
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Obx(
                      () => controller.stages.value ==
                              OrdersControllerStages.loading
                          ? SizedBox(
                              width: 1.sw,
                              height: 0.8.sh,
                              child: GeneralLoader())
                          : SizedBox(
                              height: 0.8.sh,
                              width: 1.sw,
                              child: TabBarView(
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  CurrentOrdersWidget(),
                                  PreviousOrdersWidget(),
                                ],
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
