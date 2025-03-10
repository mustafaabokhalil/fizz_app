import 'package:fizz/app_imports.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

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
            SliverAppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              title: Text('عن التطبيق'),
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
                          : Text('${AppFunctions.getSettingName('about_us')}')
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
