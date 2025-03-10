import 'package:fizz/app_imports.dart';
import 'package:fizz/view/sub_screens/current_order_details/widgets/client_data_widget.dart';
import 'package:fizz/view/sub_screens/current_order_details/widgets/items_widget.dart';
import 'package:fizz/view/sub_screens/current_order_details/widgets/order_address_widget.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GetBuilder(
          init: OrderDetailsController(),
          builder: (controller) => Obx(
                () => controller.stages.value ==
                        OrderDetailsControllerStages.Loading
                    ? const SizedBox()
                    : Container(
                        width: 1.sw,
                        height: 70.h,
                        decoration: const BoxDecoration(
                          color: AppColors.secondaryColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'حاله الطلب:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${controller.orderDetails.value!.deliveryStatusString}',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ).paddingSymmetric(horizontal: 15.w),
                      ),
              )),
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
                            ItemsWidget()
                          ],
                        ),
                ),
              ))
            ],
          ),
        ],
      ),
    );
  }
}
