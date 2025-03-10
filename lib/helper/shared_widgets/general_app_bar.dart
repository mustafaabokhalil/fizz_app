import 'package:fizz/app_imports.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final bool centerTitle;
  final bool showBackButton;
  final Widget? leading;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({
    Key? key,
    this.title,
    this.actions,
    this.centerTitle = true,
    this.showBackButton = true,
    this.leading,
    this.bottom,
  }) : super(key: key);

  CustomAppBar.withStringTitle({
    Key? key,
    required String title,
    this.actions,
    this.centerTitle = true,
    this.showBackButton = true,
    this.leading,
    this.bottom,
  })  : title = Text(
          title,
          style: TextStyle(
            fontSize: 14.0.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      toolbarHeight: 70.h,
      backgroundColor: Colors.white,
      centerTitle: centerTitle,
      actions: actions,
      elevation: 0.0,
      automaticallyImplyLeading: showBackButton,
      leading: leading ?? const ArrowBack(),
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(bottom == null
      ? kToolbarHeight
      : kToolbarHeight + bottom!.preferredSize.height);
}
