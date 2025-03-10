import 'package:fizz/app_imports.dart';
import 'package:fizz/view/intro_screens/forget_password/controller/forget_password_controller.dart';
import 'package:fizz/view/intro_screens/verification_screen/screen/verification_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.withStringTitle(
        title: 'نسيت كلمة المرور',
        leading: ArrowBack(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 1.sw,
              height: 1.sh / 2.2,
              child: Stack(
                children: [
                  Positioned(
                      top: 0.0,
                      right: 0.0,
                      child: Image.asset(
                        AppAssets.splashTopShape,
                        width: 1.sw,
                      )),
                  Positioned(
                      top: 0.0,
                      right: 0.0,
                      child: Image.asset(
                        AppAssets.loginVector,
                        height: 0.45.sh,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              'من فضلك ادخل البريد الالكترونى او رقم الجوال لارسال رمز استرجاع كلمة المرور',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.center,
            ).paddingSymmetric(horizontal: 15.w),
            SizedBox(
              height: 20.h,
            ),
            GeneralTextField(
              controller: Get.find<ForgetPasswordController>().emailController,
              icon: AppAssets.phone,
              hinText: 'البريد الالكترونى او رقم الجوال'.tr,
              isPassword: false,
              keyboardType: TextInputType.name,
            ),
            SizedBox(
              height: 40.h,
            ),
            GetBuilder(
              init: ForgetPasswordController(),
              builder: (controller) => Obx(
                () => controller.states.value ==
                        ForgetPasswordControllerStages.Loading
                    ? GeneralLoader()
                    : GeneralButton(
                        buttonColor: AppColors.primaryColor,
                        height: 45.h,
                        title: 'ارسال الان',
                        onTap: () {
                          controller.forgetPassword(context);
                        },
                        width: 1.sw,
                      ).paddingSymmetric(horizontal: 20.w),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }
}
