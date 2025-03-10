import 'package:fizz/app_imports.dart';
import 'package:fizz/view/sub_screens/current_order_details/widgets/order_status_alert.dart';

class DeliveryStatusWidget extends StatelessWidget {
  const DeliveryStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: InkWell(
                  onTap: () {
                    AppFunctions.customAlert(
                        context: context, body: const OrderStatusAlert());
                  },
                  child: Container(
                    width: 1.sw,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.r),
                        bottomRight: Radius.circular(10.r),
                      ),
                    ),
                    child: Row(
                      children: [
                        Obx(
                          () => Expanded(
                            child: Text(
                              Get.find<ChangeOrderStatusController>()
                                          .selectedOrderStatus
                                          .value !=
                                      null
                                  ? Get.find<ChangeOrderStatusController>()
                                      .selectedOrderStatus
                                      .value!
                                      .name
                                  : '${Get.find<OrderDetailsController>().orderDetails.value!.deliveryStatusString}',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 5.w),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: GetBuilder(
              init: ChangeOrderStatusController(),
              builder: (acceptOrderController) => Obx(() =>
                  acceptOrderController.trackingStates ==
                          ChangeOrderStatusControllerStatus.loading
                      ? GeneralLoader()
                      : InkWell(
                          onTap: () {
                            acceptOrderController.changeOrderStatus(
                              context: context,
                            );
                          },
                          child: Container(
                            height: 40.h,
                            decoration: BoxDecoration(
                                color: AppColors.secondaryColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.r),
                                    bottomLeft: Radius.circular(10.r))),
                            child: Center(
                                child: Text(
                              'تغير حالة الطلب',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ).paddingSymmetric(horizontal: 5.w)),
                          )))),
        ),
      ],
    ).paddingSymmetric(horizontal: 15.w);
  }
}
