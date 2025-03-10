import 'package:fizz/app_imports.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
            top: 0.0,
            right: 0.0,
            child: Image.asset(
              AppAssets.splashTopShape,
              width: 1.sw,
            )),
        CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              title: Text('الشروط والاحكام'),
              leading: ArrowBack(),
              elevation: 0.0,
            ),
            SliverToBoxAdapter(
              child: GetBuilder(
                init: SettingsController(),
                builder: (controller) => Obx(
                  () =>
                      controller.stages.value == SettingsControllerStage.loading
                          ? SizedBox(
                              width: 1.sw,
                              height: 0.8.sh,
                              child: Center(child: GeneralLoader()))
                          : Text('${AppFunctions.getSettingName('terms')}')
                              .paddingSymmetric(horizontal: 15.w),
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
