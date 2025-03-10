import 'package:fizz/app_imports.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _walletScreenScaffoldKey =
        GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _walletScreenScaffoldKey,
      drawer: const DrawerWidget(),
      body: GetBuilder(
        init: WalletController(),
        builder: (controller) => Stack(
          children: [
            Positioned(
                top: 0.0,
                right: 0.0,
                child: Image.asset(
                  AppAssets.splashTopShape,
                  width: 1.sw,
                )),
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  toolbarHeight: 60.h,
                  backgroundColor: Colors.transparent,
                  leading: InkWell(
                    onTap: () {
                      _walletScreenScaffoldKey.currentState!.openDrawer();
                    },
                    child: Transform.scale(
                      scale: 0.5,
                      child: Image.asset(
                        AppAssets.menu,
                        width: 25.w,
                      ),
                    ),
                  ),
                  centerTitle: true,
                  title: Text(
                    'المحفظة',
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
                  child: GetBuilder(
                    init: WalletController(),
                    builder: (controller) => Obx(
                      () => controller.stages.value ==
                              WalletControllerStages.loading
                          ? SizedBox(
                              width: 1.sw,
                              height: 0.8.sh,
                              child: Center(
                                child: GeneralLoader(),
                              ))
                          : Column(
                              children: [
                                Image.asset(
                                  AppAssets.decorationWallet,
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                Text(
                                  'الاجمالى',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp,
                                      fontFamily: AppFonts.tajawalExtraBold),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  '${controller.walletData.value!.wallet} ريال',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.secondaryColor,
                                      fontSize: 25.sp,
                                      fontFamily: AppFonts.tajawalExtraBold),
                                ),
                                SizedBox(
                                  height: 30.h,
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
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Text(
                                          '${controller.walletData.value!.today} ريال',
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: 1.w,
                                      height: 40.h,
                                      decoration:
                                          BoxDecoration(color: Colors.black),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'هذا الاسبوع',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Text(
                                          '${controller.walletData.value!.thisWeek} ريال',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: 1.w,
                                      height: 40.h,
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                      ),
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
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Text(
                                          '${controller.walletData.value!.thisMonth} ريال',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ).paddingSymmetric(horizontal: 15.w),
                                SizedBox(
                                  height: 30.h,
                                ),
                                GeneralButton(
                                  buttonColor: AppColors.primaryColor,
                                  height: 45.h,
                                  title: 'سحب الرصيد',
                                  onTap: () {
                                    Get.to(() => const WithdrawScreen());
                                  },
                                  width: 1.sw,
                                ).paddingSymmetric(horizontal: 15.w)
                              ],
                            ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
