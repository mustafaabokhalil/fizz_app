import 'package:fizz/app_imports.dart';
import 'package:fizz/view/sub_screens/current_order_details/screen/current_order_details.dart';

class CurrentOrdersWidget extends StatelessWidget {
  const CurrentOrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: OrdersController(),
        builder: (controller) => CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                controller.allOrders.value!.data!.current!.isEmpty
                    ? SliverToBoxAdapter(
                        child: SizedBox(
                            width: 1.sw,
                            height: 0.7.sh,
                            child: Center(
                                child: Text(
                              "لا يوجد طلبات حاليا !!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                  color: Colors.grey),
                            ))),
                      )
                    : SliverPadding(
                        padding: EdgeInsets.only(top: 10.h),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  Get.find<OrderDetailsController>()
                                      .getOrderDetails(controller.allOrders
                                          .value!.data!.current![index].id);
                                  Get.to(() => CurrentOrderDetails());
                                },
                                child: Container(
                                  width: 1.sw,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(
                                              0.1), // Shadow color with opacity
                                          spreadRadius:
                                              5, // How much the shadow spreads
                                          blurRadius:
                                              15, // Smoothness of the shadow (larger = smoother)
                                          offset: const Offset(0,
                                              3), // Changes the shadow position (x, y)
                                        ),
                                      ],
                                      border:
                                          Border.all(color: Colors.grey[200]!),
                                      borderRadius: BorderRadius.circular(8.r)),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'رقم الطلب : ',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.sp),
                                          ),
                                          const Spacer(),
                                          Text(
                                            '#${controller.allOrders.value!.data!.current![index].id} ',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.sp),
                                          ),
                                          const Spacer(),
                                          Text(
                                            '${controller.allOrders.value!.data!.current![index].deliveryStatusString}',
                                            style: TextStyle(
                                                color: AppColors.primaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.sp),
                                          )
                                        ],
                                      ).paddingAll(10.w),
                                      Row(
                                        children: [
                                          Text(
                                            'تاريخ الطلب: ',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.sp),
                                          ),
                                          const Spacer(),
                                          Text(
                                            '${controller.allOrders.value!.data!.current![index].orderDate}',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.sp),
                                          ),
                                        ],
                                      ).paddingAll(10.w),
                                      Row(
                                        children: [
                                          Text(
                                            'توقيت الطلب : ',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.sp),
                                          ),
                                          const Spacer(),
                                          Text(
                                            '${controller.allOrders.value!.data!.current![index].orderTime}',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.sp),
                                          ),
                                        ],
                                      ).paddingAll(10.w),
                                    ],
                                  ),
                                ).paddingOnly(
                                    bottom: 10.h, left: 10.w, right: 10.w),
                              );
                            },
                            childCount: controller.allOrders.value!.data!
                                .current!.length, // 1000 list items
                          ),
                        ),
                      ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 60.h,
                  ),
                )
              ],
            ));
  }
}
