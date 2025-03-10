import 'package:fizz/app_imports.dart';

class OrderAddressWidget extends StatelessWidget {
  const OrderAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: OrderDetailsController(),
      builder: (controller) => Container(
        width: 1.sw,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color:
                    Colors.grey.withOpacity(0.1), // Shadow color with opacity
                spreadRadius: 5, // How much the shadow spreads
                blurRadius: 15, // Smoothness of the shadow (larger = smoother)
                offset:
                    const Offset(0, 3), // Changes the shadow position (x, y)
              ),
            ],
            border: Border.all(color: Colors.grey[200]!),
            borderRadius: BorderRadius.circular(15.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Text(
              'عنوان الطلب',
              style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ).paddingSymmetric(horizontal: 10.w),
            SizedBox(
              height: 10.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.network(
                    'https://img.freepik.com/premium-vector/store-with-location-sign-vector-icon-illustration_1080480-129899.jpg',
                    width: 40.w,
                    height: 40.h,
                  ).paddingSymmetric(horizontal: 5.w),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'من : ${controller.orderDetails.value!.addressFrom}',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'إلى : ${controller.orderDetails.value!.addressTo}',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ).paddingSymmetric(horizontal: 10.w),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    AppFunctions.makePhoneCall(
                        '${controller.orderDetails.value!.phoneFrom}');
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssets.call2,
                        height: 15.h,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'اتصال',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp),
                      ).paddingOnly(top: 5.h)
                    ],
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    AppFunctions.openMap(
                        double.parse(
                            controller.orderDetails.value!.latFrom.toString()),
                        double.parse(controller.orderDetails.value!.longFrom
                            .toString()));
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssets.directionArrow,
                        height: 20.h,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'الاتجاهات',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp),
                      ).paddingOnly(top: 5.h)
                    ],
                  ),
                ),
                Spacer(),
                Spacer(),
              ],
            ).paddingAll(15.w),
          ],
        ),
      ).paddingSymmetric(horizontal: 15.w),
    );
  }
}
