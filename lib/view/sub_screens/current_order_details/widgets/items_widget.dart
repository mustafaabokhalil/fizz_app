import 'package:fizz/app_imports.dart';

class ItemsWidget extends StatelessWidget {
  const ItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: OrderDetailsController(),
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 1.sw,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey
                        .withOpacity(0.1), // Shadow color with opacity
                    spreadRadius: 5, // How much the shadow spreads
                    blurRadius:
                        15, // Smoothness of the shadow (larger = smoother)
                    offset: const Offset(
                        0, 3), // Changes the shadow position (x, y)
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
                  'عموله التوصيل:',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ).paddingSymmetric(horizontal: 10.w),
                Row(
                  children: [
                    Text(
                      '${controller.orderDetails.value!.shipping}',
                      style: TextStyle(
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp),
                    ).paddingOnly(top: 5.h),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'ريال',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp),
                    ).paddingOnly(top: 2.h),
                    Spacer(),
                  ],
                ).paddingAll(15.w),
              ],
            ),
          ).paddingSymmetric(horizontal: 15.w),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'العناصر : ${controller.orderDetails.value!.orderItems!.length}',
            style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ).paddingSymmetric(horizontal: 10.w),
          Column(
            children: List.generate(
                controller.orderDetails.value!.orderItems!.length,
                (index) => Column(
                      children: [
                        ListTile(
                          leading: SizedBox(
                            width: 40.w,
                            height: 40.h,
                            child: ClipOval(
                              child: Image.network(
                                'https://images.pexels.com/photos/3434533/pexels-photo-3434533.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          title: Text(
                              '${controller.orderDetails.value!.orderItems![index].name}'),
                          subtitle: Text(
                              ' الوزن:  ${controller.orderDetails.value!.orderItems![index].price}'),
                          trailing: Text(
                            'الكمية: ${controller.orderDetails.value!.orderItems![index].quantity}',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Divider(),
                      ],
                    )),
          ),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }
}
