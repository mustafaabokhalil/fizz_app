import 'package:fizz/app_imports.dart';

class CustomStepperText extends StatelessWidget {
  const CustomStepperText(
      {super.key, required this.title, required this.isActive});
  final String title;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: isActive ? const Color(0xffFE696A) : Colors.grey[500],
      ),
    );
  }
}
