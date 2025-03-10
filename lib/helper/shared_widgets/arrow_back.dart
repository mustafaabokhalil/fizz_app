import 'package:fizz/app_imports.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({
    super.key,
    this.onTap,
    this.color,
  });
  final void Function()? onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap ??
            () {
              Get.back();
            },
        child: Icon(
          Icons.arrow_back,
          color: color ?? Colors.black,
        ));
  }
}
