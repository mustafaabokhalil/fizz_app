import 'package:fizz/app_imports.dart';
import 'package:fizz/models/order_status_model.dart';

class OrderStatusAlert extends StatelessWidget {
  const OrderStatusAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 1.sw,
        height: 290.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(
                orderStatusList.length,
                (index) => InkWell(
                      onTap: () {
                        Get.back();
                        Get.find<ChangeOrderStatusController>()
                            .selectedOrderStatus
                            .value = orderStatusList[index];
                      },
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  orderStatusList[index].name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Image.asset(
                                  orderStatusList[index].image,
                                  width: 50.w,
                                  height: 60.h,
                                ),
                              ],
                            ).paddingSymmetric(horizontal: 10.w),
                            if (index + 1 != orderStatusList.length) Divider()
                          ],
                        ),
                      ),
                    )),
          ),
        ));
  }
}
