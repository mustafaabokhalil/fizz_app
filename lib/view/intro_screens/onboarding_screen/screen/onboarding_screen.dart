import 'package:fizz/app_imports.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: OnboardingController(),
        builder: (controller) => Obx(
          () => controller.stages.value == OnboardingControllerStages.loading
              ? const GeneralLoader()
              : Stack(
                  alignment: Alignment.center,
                  children: [
                    PageView(
                      onPageChanged: (value) {
                        controller.onboaedingIndex.value = value;
                      },
                      children: List.generate(
                          controller.onboardingList.length,
                          (index) => ObboardingWidget(
                                image: controller.onboardingList[index].image!,
                                title: controller.onboardingList[index].title!,
                                index: 0,
                                subTitle:
                                    controller.onboardingList[index].desc!,
                              )),
                    ),
                    Obx(
                      () => Positioned(
                        bottom: 40.h,
                        child: OnBoardingGradientPageIndicator(
                          currentIndex: controller.onboaedingIndex.value,
                          pageCount: controller.onboardingList.length,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50.h,
                      right: 20.w,
                      child: InkWell(
                        onTap: () {
                          // Get.to(() => const NavigationHomeScreen());
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.arrow_back, color: Colors.black),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'تخطي',
                              style: TextStyle(
                                  fontFamily: AppFonts.tajawalExtraBold,
                                  fontWeight: FontWeight.bold,
                                  height: 1.7.sp,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
