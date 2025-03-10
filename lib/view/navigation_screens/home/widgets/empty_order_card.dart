import 'package:fizz/app_imports.dart';

class EmptyOrderCard extends StatelessWidget {
  const EmptyOrderCard({super.key});

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
          Image.asset(
            AppAssets.emptyOrders,
            height: 100.h,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'ليس لديك طلبات لانك غير متاح',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ).paddingAll(20.h),
    ).paddingSymmetric(horizontal: 15.w);
  }
}
