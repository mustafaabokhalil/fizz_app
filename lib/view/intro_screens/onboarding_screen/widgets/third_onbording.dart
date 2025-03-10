import 'package:fizz/app_imports.dart';
import 'package:fizz/view/intro_screens/onboarding_screen/widgets/onboarding_widget.dart';

class ThirdOnboarding extends StatelessWidget {
  const ThirdOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return const ObboardingWidget(
      image: AppAssets.onboarding3,
      title: 'احصل علي المنتجات الطازج من المزارعين المحليين',
      subTitle:
          'ابحث عن افضل أنواع الأسماك الطازج يوميا من البحر الي متاجرنا مباشرة موصولة مباشرة الي باب منزلك',
      index: 2,
    );
  }
}
