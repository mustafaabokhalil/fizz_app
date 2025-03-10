import 'package:fizz/app_imports.dart';
import 'package:fizz/view/sub_screens/delivery_map_screen/controller/delivery_map_controller.dart';
import 'package:fizz/view/sub_screens/recieve_order_screen/screen/recieve_order_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DeliveryMapScreen extends StatelessWidget {
  const DeliveryMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: const ArrowBack(),
        elevation: 0.0,
        title: const Text('اذهب الى عنوان الطلب'),
      ),
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Column(
          children: [
            GetBuilder<DeliveryMapLocation>(
              init: DeliveryMapLocation(),
              builder: (controller) => Container(
                height: 400.h,
                width: 1.sw,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      15.r), // Apply the same border radius
                  child: GoogleMap(
                    onMapCreated: controller.onMapCreated,
                    markers: controller.markers,
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(30.0, 30.0),
                      zoom: 1.0,
                    ),
                  ),
                ),
              ).paddingSymmetric(horizontal: 15.w),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: 1.sw,
              height: 40.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.grey[200],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(AppAssets.addresses),
                  ),
                  const Text(
                    'شارع سعد الدين امام الخديوى',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ).paddingSymmetric(horizontal: 15.w),
            SizedBox(
              height: 50.h,
            ),
            GeneralButton(
              buttonColor: AppColors.primaryColor,
              height: 40.h,
              title: 'الوصول الى عنوان الطلب',
              onTap: () {
                Get.to(() => const ReceiveOrdersScreen());
              },
              width: 1.sw,
            ).paddingSymmetric(horizontal: 15.w)
          ],
        ),
      ),
    );
  }
}