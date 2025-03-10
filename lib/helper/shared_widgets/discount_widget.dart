import 'package:fizz/app_imports.dart';

class DiscountWidget extends StatelessWidget {
  const DiscountWidget(
      {super.key, required this.priceAfter, required this.price});
  final String price;
  final String priceAfter;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        priceAfter != null
            ? Row(
                children: [
                  Text(
                    price,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: '',
                        decoration: TextDecoration.lineThrough,
                        color: AppColors.primaryColor),
                  ),
                  Text(
                    'ريال',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough,
                        color: AppColors.primaryColor),
                  ),
                ],
              )
            : Text(
                price + ' ريال',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor),
              ),
        SizedBox(
          width: 15.w,
        ),
        if (priceAfter != null)
          Text(
            priceAfter + ' ريال',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16.sp,
                height: 1.5,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor),
          )
      ],
    );
  }
}
