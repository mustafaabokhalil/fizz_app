import 'package:fizz/app_imports.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    super.key,
    required this.onTap,
    required this.title,
  });
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 1.sw,
        height: 40.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1), // Shadow color with opacity
              spreadRadius: 5, // How much the shadow spreads
              blurRadius: 15, // Smoothness of the shadow (larger = smoother)
              offset: const Offset(0, 3), // Changes the shadow position (x, y)
            ),
          ],
        ),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: Colors.grey)
          ],
        ).paddingSymmetric(horizontal: 10.w),
      ).paddingSymmetric(horizontal: 15.w),
    );
  }
}
