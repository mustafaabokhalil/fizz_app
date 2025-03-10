import 'package:fizz/app_imports.dart';

class WithdrawTextField extends StatelessWidget {
  const WithdrawTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    this.height,
  });
  final String hintText;
  final TextEditingController controller;
  final double? height;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: height ?? 40.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1), // Shadow color with opacity
            spreadRadius: 5, // How much the shadow spreads
            blurRadius: 15, // Smoothness of the shadow (larger = smoother)
            offset: const Offset(0, 3), // Changes the shadow position (x, y)
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,
        decoration: InputDecoration(
            hintStyle: TextStyle(height: 1.8),
            border: InputBorder.none,
            hintText: hintText),
      ).paddingSymmetric(horizontal: 10.w),
    );
  }
}
