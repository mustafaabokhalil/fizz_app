import 'package:fizz/app_imports.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 0.0,
              right: 0.0,
              child: Image.asset(
                AppAssets.splashTopShape,
                width: 1.sw,
              )),
          CustomScrollView(
            slivers: <Widget>[
              const SliverAppBar(
                centerTitle: true,
                backgroundColor: Colors.transparent,
                title: Text('تفاصيل الطلب'),
                leading: ArrowBack(),
                elevation: 0.0,
              ),
              SliverToBoxAdapter(
                child: GetBuilder(
                  init: OrderDetailsController(),
                  builder: (controller) => Obx(
                    () => controller.stages.value ==
                            OrderDetailsControllerStages.Loading
                        ? SizedBox(
                            width: 1.sw,
                            height: 0.8.sh,
                            child: Center(
                              child: GeneralLoader(),
                            ),
                          )
                        : controller.stages.value ==
                                OrderDetailsControllerStages.error
                            ? SizedBox(
                                width: 1.sw,
                                height: 0.8.sh,
                                child: Center(child: Text('عفواً لقد حدث خطأ')),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  OrderAddressWidget(),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  ClientDataWidget(),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  ItemsWidget(),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Align(
                                            alignment: AlignmentDirectional
                                                .centerStart,
                                            child: GetBuilder(
                                              init: AcceptOrderController(),
                                              builder:
                                                  (acceptOrderController) =>
                                                      GeneralButton(
                                                buttonColor:
                                                    AppColors.primaryColor,
                                                width: 1.sw,
                                                onTap: () {
                                                  AppFunctions.customAlert(
                                                      context: context,
                                                      body: Container(
                                                        width: 1.sw,
                                                        height: 200.h,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Image.asset(AppAssets
                                                                .deliveryIconPark),
                                                            SizedBox(
                                                              height: 10.h,
                                                            ),
                                                            Text(
                                                              'هل توكد التسليم للطلب',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      16.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Text(
                                                              '#${controller.orderDetails.value!.id}',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      16.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              height: 10.h,
                                                            ),
                                                            Obx(
                                                              () => acceptOrderController
                                                                          .stages ==
                                                                      AcceptOrderControllerStages
                                                                          .loading
                                                                  ? GeneralLoader()
                                                                  : GeneralButton(
                                                                      buttonColor:
                                                                          AppColors
                                                                              .primaryColor,
                                                                      height:
                                                                          35.h,
                                                                      title:
                                                                          'تاكيد',
                                                                      onTap:
                                                                          () {
                                                                        acceptOrderController.acceptOrder(
                                                                            context:
                                                                                context,
                                                                            orderId:
                                                                                controller.orderDetails.value!.id);
                                                                      },
                                                                      width: 150
                                                                          .w),
                                                            ),
                                                            SizedBox(
                                                              height: 10.h,
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                Get.back();
                                                              },
                                                              child: Text(
                                                                'إلغاء',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16.sp,
                                                                    color: Colors
                                                                        .grey,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ));

                                                  // Get.to(() => DeliveryMapScreen());
                                                },
                                                textColor: Colors.white,
                                                height: 40.h,
                                                title: 'قبول',
                                              ).paddingAll(10.w),
                                            )),
                                      ),
                                      Expanded(
                                        child: Align(
                                            alignment: AlignmentDirectional
                                                .centerStart,
                                            child: GetBuilder(
                                              init: AcceptOrderController(),
                                              builder:
                                                  (acceptOrderController) =>
                                                      GeneralButton(
                                                buttonColor:
                                                    AppColors.secondaryColor,
                                                width: 1.sw,
                                                onTap: () {
                                                  Get.back();
                                                },
                                                textColor: Colors.white,
                                                height: 40.h,
                                                title: 'رفض',
                                              ).paddingAll(10.w),
                                            )),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 50.h),
                                  Row(
                                    children: [],
                                  )
                                ],
                              ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
