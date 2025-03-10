import 'package:fizz/app_imports.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.onTap,
  });
  final dynamic Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      decoration: const BoxDecoration(color: Colors.red),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 80.sp,
            color: Colors.white,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'عفواً لقد حدث خطأ  !',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18.sp),
          ),
          SizedBox(
            height: 40.h,
          ),
          GeneralButton(
            buttonColor: AppColors.primaryColor,
            onTap: onTap,
            width: 1.sw,
            height: 45.h,
            title: 'أعد المحاولة',
          ).paddingSymmetric(horizontal: 15.w)
        ],
      ),
    );
  }
}
