import 'package:fizz/app_imports.dart';
import 'package:fizz/models/pusher_order_model.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.orderData,
  });
  final PusherOrder orderData;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1), // Shadow color with opacity
              spreadRadius: 5, // How much the shadow spreads
              blurRadius: 15, // Smoothness of the shadow (larger = smoother)
              offset: const Offset(0, 3), // Changes the shadow position (x, y)
            ),
          ],
          border: Border.all(color: Colors.grey[200]!),
          borderRadius: BorderRadius.circular(15.r)),
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
              Spacer(),
              Text(
                '#${orderData.orderCode} ',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp),
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
              Spacer(),
              Text(
                '${orderData.orderDate}',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp),
              ),
              SizedBox(
                width: 5.w,
              ),
              // Image.asset(
              //   AppAssets.directionArrow,
              //   height: 20.h,
              // )
            ],
          ).paddingAll(10.w),
          Row(
            children: [
              Text(
                'حالة الطلب : ',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp),
              ),
              Spacer(),
              Text(
                '${orderData.deliveryStatusString}',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp),
              ),
              // SizedBox(
              //   width: 5.w,
              // ),
              // Image.asset(
              //   AppAssets.directionArrow,
              //   height: 20.h,
              // )
            ],
          ).paddingAll(10.w),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: GeneralButton(
              buttonColor: AppColors.primaryColor,
              width: 150.w,
              onTap: () {
                Get.find<OrderDetailsController>()
                    .getOrderDetails(orderData.id);
                Get.to(() => OrderDetailsScreen());
              },
              height: 40.h,
              title: 'البدء',
            ).paddingAll(10.w),
          )
        ],
      ),
    );
  }
}
