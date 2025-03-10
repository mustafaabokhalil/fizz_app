import 'package:fizz/app_imports.dart';
import 'package:fizz/view/intro_screens/reset_password_screen/screen/reset_password_screen.dart';
import 'package:fizz/view/intro_screens/verification_screen/controller/verification_controller.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: VerificationController(),
        builder: (controller) => SingleChildScrollView(
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
              Text(
                'كود الاسترجاع',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                  fontFamily: AppFonts.tajawalExtraBold,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                'من فضلك ادخل الكود المرسل الى البريد الالكترونى او رقم الجوال لارسال رمز استرجاع كلمة المرور',
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
              Directionality(
                textDirection: TextDirection.ltr,
                child: OtpTextField(
                  autoFocus: true,
                  numberOfFields: 4,
                  fieldWidth: 45.w,
                  borderRadius: BorderRadius.circular(1000.r),
                  fillColor: Colors.grey.withOpacity(0.2),
                  disabledBorderColor: AppColors.primaryColor,
                  focusedBorderColor: AppColors.primaryColor,
                  filled: true,
                  borderColor: AppColors.primaryColor,
                  enabledBorderColor: AppColors.primaryColor,
                  clearText: true,
                  showFieldAsBox: true,
                  cursorColor: AppColors.primaryColor,
                  onCodeChanged: (String value) {},
                  handleControllers: (controllers) {},
                  onSubmit: (String verificationCode) {
                    controller.selectedOtp.value = verificationCode;
                  }, // end onSubmit
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              GeneralButton(
                buttonColor: AppColors.primaryColor,
                height: 45.h,
                title: 'ارسال الان',
                onTap: () {
                  if (controller.forgetPasswordOtp.value ==
                      controller.selectedOtp.value) {
                    Get.to(() => ResetPasswordScreen());
                  } else {
                    AppFunctions.showErrorSnackBar(
                        snackBarPosition: SnackBarPosition.top,
                        context: context,
                        message: 'برجاء التأكد من الكود واعادة المحاولة');
                  }
                },
                width: 1.sw,
              ).paddingSymmetric(horizontal: 20.w),
            ],
          ),
        ),
      ),
    );
  }
}
