import 'package:fizz/app_imports.dart';

class GeneralLoader extends StatelessWidget {
  const GeneralLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 30.0, // Set the desired height
        width: 30.0, // Set the desired width
        child: CircularProgressIndicator.adaptive(
          backgroundColor: AppColors.primaryColor.withOpacity(0.5),
          strokeWidth: 5.sp,
          valueColor:
              const AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
        ),
      ),
    );
  }
}
