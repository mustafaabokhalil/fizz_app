import 'package:fizz/app_imports.dart';

class ClientDataWidget extends StatelessWidget {
  const ClientDataWidget({super.key});

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
              'تفاصيل الزبون والتوصيل',
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
                  child: Image.asset(
                    AppAssets.profile,
                    width: 40.w,
                    height: 40.h,
                  ).paddingSymmetric(horizontal: 5.w),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${controller.orderDetails.value!.clientName}',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${controller.orderDetails.value!.clientPhone}',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ).paddingSymmetric(horizontal: 10.w),
            InkWell(
              onTap: () {
                AppFunctions.makePhoneCall(
                    '${controller.orderDetails.value!.clientPhone}');
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
                  ).paddingOnly(top: 5.h),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      AppFunctions.openMap(
                          double.parse(
                              controller.orderDetails.value!.latTo.toString()),
                          double.parse(controller.orderDetails.value!.longTo
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
            ),
          ],
        ),
      ).paddingSymmetric(horizontal: 15.w),
    );
  }
}
