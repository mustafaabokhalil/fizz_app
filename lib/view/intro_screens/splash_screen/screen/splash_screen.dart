import 'package:fizz/app_imports.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder(
        init: SplashController(),
        builder: (controller) => SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Image.asset(
                  AppAssets.splashLogo,
                  width: 250.w,
                ),
              ),
              Positioned(
                top: 0.0,
                right: 0.0,
                child: Image.asset(
                  AppAssets.splashTopShape,
                  height: 250.w,
                ),
              ),
              Positioned(
                bottom: 150.h,
                child: Align(
                  alignment: AlignmentDirectional.center,
                  child: Image.asset(
                    AppAssets.splashVectorShape,
                    width: 300.w,
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                child: Image.asset(
                  AppAssets.splashBottomShape,
                  width: 1.sw,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
