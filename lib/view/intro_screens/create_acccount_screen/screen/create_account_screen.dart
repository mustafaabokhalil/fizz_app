import 'package:fizz/app_imports.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final creteAccountProvider = Get.find<CreateAccountController>();
    return Scaffold(
        body: PageView(
      controller: creteAccountProvider.pageController,
      onPageChanged: (value) {
        creteAccountProvider.registerIndex.value = value;
      },
      physics: NeverScrollableScrollPhysics(),
      children: const [
        RegisterStepOne(),
        RegisterStepTwo(),
        RegisterStepThree(),
      ],
    ));
  }
}
