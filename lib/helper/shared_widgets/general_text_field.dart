import 'package:flutter/services.dart';
import 'package:fizz/app_imports.dart';

class GeneralTextField extends StatelessWidget {
  GeneralTextField(
      {super.key,
      required this.controller,
      required this.hinText,
      required this.icon,
      this.keyboardType,
      required this.isPassword,
      this.inputFormatters,
      this.obscureText,
      this.suffixIcon});
  TextEditingController controller = TextEditingController();
  final String hinText;
  final String icon;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  bool isPassword = false;
  bool? obscureText = false;
  List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    return isPassword
        ? Container(
            width: 1.sw,
            height: 40.h,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  Image.asset(
                    icon,
                    width: 20.w,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: controller,
                      style: TextStyle(fontSize: 16.sp),
                      cursorColor: Colors.grey,
                      keyboardType: keyboardType ?? TextInputType.phone,
                      obscureText: obscureText ?? false,
                      decoration: InputDecoration(
                          suffixIcon: suffixIcon ?? const SizedBox(),
                          hintText: hinText,
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
          ).paddingSymmetric(horizontal: 20.w)
        : Container(
            width: 1.sw,
            height: 40.h,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  Image.asset(
                    icon,
                    width: 20.w,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: controller,
                      inputFormatters: inputFormatters ??
                          [
                            LengthLimitingTextInputFormatter(
                                50), //n is maximum number of characters you want in textfield
                          ],
                      cursorColor: Colors.grey,
                      keyboardType: keyboardType ?? TextInputType.phone,
                      style: TextStyle(fontSize: 14.sp),
                      decoration: InputDecoration(
                          suffixIcon: suffixIcon ?? const SizedBox(),
                          hintText: hinText,
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
          ).paddingSymmetric(horizontal: 20.w);
  }
}
