import 'package:fizz/app_imports.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.onTap,
    required this.title,
  });

  final void Function()? onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 1.sw,
        height: 50.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r), color: Colors.white),
        child: Row(
          children: [Text(title), const Spacer(), Icon(Icons.arrow_back_ios)],
        ).paddingSymmetric(horizontal: 15.w),
      ),
    );
  }
}
