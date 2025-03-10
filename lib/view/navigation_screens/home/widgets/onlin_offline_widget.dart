import 'package:fizz/app_imports.dart';

class OnlineOfflineWidget extends StatelessWidget {
  const OnlineOfflineWidget({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15.w,
      height: 15.h,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
            width: 2.sp, color: AppColors.primaryColor.withOpacity(0.5)),
        shape: BoxShape.circle,
      ),
    );
  }
}
