import 'package:fizz/app_imports.dart';
import 'package:fizz/view/intro_screens/onboarding_screen/widgets/onboarding_widget.dart';

class SecondOnboarding extends StatelessWidget {
  const SecondOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return const ObboardingWidget(
      image: AppAssets.onboarding2,
      title: 'احصل علي المنتجات الطازجة من المزارعين المحليين',
      subTitle:
          'ابحث عن افضل الفواكه و الخضروات المحصولة يدويا من المزارعين المحليين موصولة مباشرة الي باب منزلك',
      index: 1,
    );
  }
}
