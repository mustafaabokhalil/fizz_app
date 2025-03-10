import 'package:fizz/app_imports.dart';

class RoundedStepperContainer extends StatelessWidget {
  const RoundedStepperContainer({
    super.key,
    required this.isActive,
    required this.title,
  });
  final String title;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25.w,
      height: 20.h,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? Color(0xffFE696A) : Colors.grey[400]),
      child: Center(
          child: Text(
        title,
        style: TextStyle(
            height: 1.5, color: isActive ? Colors.white : Colors.black),
      )),
    );
  }
}
