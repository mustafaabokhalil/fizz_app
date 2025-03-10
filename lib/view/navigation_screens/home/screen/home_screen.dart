import 'package:fizz/app_imports.dart';

import 'package:fizz/view/navigation_screens/home/widgets/empty_order_card.dart';
import 'package:fizz/view/navigation_screens/home/widgets/order_card.dart';
import 'package:fizz/view/navigation_screens/home/widgets/user_data_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final homeController = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      drawer: const DrawerWidget(),
      body: Stack(children: [
        Positioned(
            top: 0.0,
            right: 0.0,
            child: Image.asset(
              AppAssets.splashTopShape,
              width: 1.sw,
            )),
        CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              toolbarHeight: 60.h,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: const Text('الرئيسية'),
              leading: Transform.scale(
                scale: 0.6,
                child: InkWell(
                  onTap: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  child: Image.asset(
                    AppAssets.menu,
                    width: 25.w,
                    height: 20.h,
                  ),
                ),
              ),
              actions: [
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserDataWidget(),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'اشعارات الطلبات',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ).paddingSymmetric(horizontal: 15.w),
                  SizedBox(
                    height: 10.h,
                  ),
                  Obx(() => homeController.homeStages.value ==
                          HomeControllerStages.Loading
                      ? SizedBox(
                          width: 1.sw,
                          height: 0.8.sh,
                          child: Center(child: GeneralLoader()),
                        )
                      : Obx(() =>
                          Get.find<OrdersController>().pusherOrders.isEmpty
                              ? homeController
                                      .homeResponse.value!.data!.orders!.isEmpty
                                  ? EmptyOrderCard()
                                  : Column(
                                      children: List.generate(
                                          homeController.homeResponse.value!
                                              .data!.orders!.length,
                                          (index) => InkWell(
                                                onTap: () {},
                                                child: OrderCard(
                                                  orderData: homeController
                                                      .homeResponse
                                                      .value!
                                                      .data!
                                                      .orders![index],
                                                ).paddingOnly(bottom: 10.h),
                                              )),
                                    )
                              : Column(
                                  children: List.generate(
                                      Get.find<OrdersController>()
                                          .pusherOrders
                                          .length,
                                      (index) => InkWell(
                                            onTap: () {},
                                            child: OrderCard(
                                              orderData:
                                                  Get.find<OrdersController>()
                                                      .pusherOrders[index],
                                            ).paddingOnly(bottom: 10.h),
                                          )),
                                )).paddingSymmetric(horizontal: 15.w)),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Obx(
                () => homeController.homeStages.value ==
                        HomeControllerStages.Loading
                    ? SizedBox()
                    : homeController.homeStages.value ==
                            HomeControllerStages.error
                        ? SizedBox()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                'الطلبات',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                ),
                              ).paddingSymmetric(horizontal: 15.w),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 70.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          color: Color(0xffFF6667)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'هذا اليوم',
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            homeController.homeResponse.value!
                                                .data!.numberOfTodayOrders
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 25.w,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 70.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          color: Color(0xffFF6667)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'هذا الاسبوع',
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            '${homeController.homeResponse.value!.data!.numberOfWeekOrders}',
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ).paddingSymmetric(horizontal: 15.w)
                            ],
                          ),
              ),
            ),
            SliverToBoxAdapter(
              child: Obx(
                () => homeController.homeStages.value ==
                        HomeControllerStages.Loading
                    ? SizedBox()
                    : homeController.homeStages.value ==
                            HomeControllerStages.error
                        ? SizedBox()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                'المحفظه',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                ),
                              ).paddingSymmetric(horizontal: 15.w),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                width: 1.sw,
                                height: 120.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: Color(0xff515151)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          AppAssets.wallet,
                                          height: 30.h,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text(
                                          '${homeController.homeResponse.value!.data!.wallet!.wallet} ريال',
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'هذا اليوم',
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Text(
                                              '${homeController.homeResponse.value!.data!.wallet!.today} ريال',
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                        Container(
                                          width: 1.w,
                                          height: 40.h,
                                          decoration: BoxDecoration(
                                              color: Colors.white),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'هذا الأسبوع',
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Text(
                                              '${homeController.homeResponse.value!.data!.wallet!.thisWeek} ريال',
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                        Container(
                                          width: 1.w,
                                          height: 40.h,
                                          decoration: BoxDecoration(
                                              color: Colors.white),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'هذا الشهر',
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Text(
                                              '${homeController.homeResponse.value!.data!.wallet!.thisMonth} ريال',
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ).paddingAll(10.w),
                              ).paddingSymmetric(horizontal: 15.w)
                            ],
                          ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 50.h,
              ),
            )
          ],
        )
      ]),
    );
  }
}
