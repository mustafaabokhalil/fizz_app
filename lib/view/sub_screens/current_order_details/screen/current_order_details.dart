import 'package:fizz/app_imports.dart';
import 'package:fizz/view/sub_screens/current_order_details/widgets/delivery_status_widget.dart';

class CurrentOrderDetails extends StatelessWidget {
  const CurrentOrderDetails({super.key});

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
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              OrderAddressWidget(),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                'حالة الطلب',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ).paddingSymmetric(
                                  horizontal: 15.w, vertical: 10.h),
                              DeliveryStatusWidget(),
                              SizedBox(
                                height: 15.h,
                              ),
                              ClientDataWidget(),
                              SizedBox(
                                height: 20.h,
                              ),
                              ItemsWidget()
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
