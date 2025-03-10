import 'package:fizz/app_imports.dart';

class GeneralButton extends StatelessWidget {
  const GeneralButton(
      {Key? key,
      required this.buttonColor,
      required this.height,
      required this.title,
      required this.onTap,
      this.fontSize,
      this.textColor,
      this.radius,
      required this.width})
      : super(key: key);
  final Color? buttonColor;
  final Color? textColor;
  final double? height;
  final double? width;
  final String? title;
  final Function()? onTap;
  final double? fontSize;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(radius ?? 25.r),
          ),
          child: Center(
            child: Text(
              '$title',
              style: TextStyle(
                color: textColor ?? Colors.black87,
                fontFamily: AppFonts.tajawalExtraBold,
                fontSize: fontSize ?? 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ));
  }
}
