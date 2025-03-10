import 'package:fizz/app_imports.dart';
import 'package:fizz/view/intro_screens/onboarding_screen/widgets/onboarding_widget.dart';

class FirstOnboarding extends StatelessWidget {
  const FirstOnboarding({
    super.key,
    required this.desc,
    required this.title,
  });
  final String title;
  final String desc;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 1.sh,
      child: const ObboardingWidget(
        image: AppAssets.onboarding1,
        title: 'مرحبا بكم في تطبيق ',
        subTitle:
            'ابدأ في استخدام تطبيقنا السهل الاستخدام و استمتع باللحوم و الفواكه و الخضروات و الأسماك الطازجة و الصحيه \nالموصولة مباشرة الي منزلك',
        index: 0,
      ),
    );
  }
}
