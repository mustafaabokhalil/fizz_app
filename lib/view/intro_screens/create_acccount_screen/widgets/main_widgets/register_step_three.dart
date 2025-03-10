import 'package:fizz/app_imports.dart';
import 'package:fizz/view/intro_screens/create_acccount_screen/widgets/sub_widgets/stepper.dart';

class RegisterStepThree extends StatelessWidget {
  const RegisterStepThree({super.key});

  @override
  Widget build(BuildContext context) {
    final registerController = Get.find<CreateAccountController>();
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: 1.sw,
          height: 1.sh / 2.1,
          child: Stack(
            children: [
              Positioned(
                  top: 0.0,
                  right: 0.0,
                  child: Image.asset(
                    AppAssets.splashTopShape,
                    width: 1.sw,
                    height: 300.h,
                    fit: BoxFit.cover,
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Image.asset(
                  AppAssets.registerVectorLastStep,
                  height: 0.2.sh,
                  width: 1.sw - 20,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: 20.h,
                ),
                const StepperWidget(),
                SizedBox(
                  height: 20.h,
                ),
                GeneralTextField(
                  controller: registerController.phoneController,
                  icon: AppAssets.callIcons,
                  hinText: 'رقم الجوال',
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(
                        10), //n is maximum number of characters you want in textfield
                  ],
                  isPassword: false,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: 10.h,
                ),
                GeneralTextField(
                  controller: registerController.emailController,
                  icon: AppAssets.email,
                  hinText: 'الايميل',
                  isPassword: false,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: 10.h,
                ),
                GeneralTextField(
                  controller: registerController.passwordController,
                  icon: AppAssets.lock,
                  isPassword: true,
                  hinText: 'كلمة المرور',
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Obx(
                  () => registerController.stages.value ==
                          CreateAccountControllerStages.loading
                      ? GeneralLoader()
                      : GeneralButton(
                          buttonColor: AppColors.primaryColor,
                          height: 45.h,
                          title: 'تسجيل'.tr,
                          onTap: () {
                            registerController.createAccount(context);
                          },
                          width: 1.sw,
                        ).paddingSymmetric(horizontal: 20.w),
                ),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                  onTap: () {
                    Get.find<CreateAccountController>()
                        .pageController
                        .animateToPage(1,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.bounceIn);
                  },
                  child: Text(
                    'السابق',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
