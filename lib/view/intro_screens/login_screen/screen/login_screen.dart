import 'package:fizz/app_imports.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: GetBuilder(
          init: LoginController(),
          builder: (loginController) => SizedBox(
            width: 1.sw,
            height: 1.sh,
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
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'تسجيل الدخول'.tr,
                          style: TextStyle(
                              fontFamily: AppFonts.tajawalExtraBold,
                              fontSize: 18.sp),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        GeneralTextField(
                          controller: loginController.emailController,
                          icon: AppAssets.phone,
                          hinText: 'البريد الالكترونى',
                          isPassword: false,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Obx(
                          () => GeneralTextField(
                            controller: loginController.passwordController,
                            icon: AppAssets.lock,
                            hinText: 'كلمة المرور'.tr,
                            isPassword: true,
                            obscureText:
                                loginController.isPasswordVisible.value,
                            keyboardType: TextInputType.visiblePassword,
                            suffixIcon: InkWell(
                              onTap: () {
                                loginController.isPasswordVisible.value =
                                    !loginController.isPasswordVisible.value;
                              },
                              child: Icon(
                                loginController.isPasswordVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey[400],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 18.w,
                              height: 18.h,
                              decoration: const BoxDecoration(
                                  color: AppColors.primaryColor,
                                  shape: BoxShape.circle),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 15.sp,
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              'remember_me'.tr,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: InkWell(
                                onTap: () {
                                  Get.to(() => const ForgetPasswordScreen());
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                    color: Colors.black,
                                  ))),
                                  child: Text(
                                    'forgot_pass'.tr,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.sp),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 20.w),
                        SizedBox(
                          height: 30.h,
                        ),
                        Obx(() => loginController.loginStates.value ==
                                LoginStates.loading
                            ? const GeneralLoader()
                            : GeneralButton(
                                buttonColor: AppColors.primaryColor,
                                height: 45.h,
                                title: 'login'.tr,
                                onTap: () {
                                  if (loginController
                                          .emailController.text.isNotEmpty &&
                                      loginController
                                          .passwordController.text.isNotEmpty) {
                                    loginController.login(context);
                                  } else {
                                    AppFunctions.showErrorSnackBar(
                                        snackBarPosition: SnackBarPosition.top,
                                        context: context,
                                        message: 'verify_phone_password'.tr);
                                  }
                                },
                                width: 1.sw,
                              ).paddingSymmetric(horizontal: 20.w)),
                        SizedBox(
                          height: 20.h,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => const CreateAccountScreen());
                          },
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'have_no_acc_register'.tr,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey,
                                    fontFamily: AppFonts.tajawalExtraBold,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: 'sign_up'.tr,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: AppFonts.tajawalExtraBold,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        // InkWell(
                        //   onTap: () {
                        //     LocalStorage.token = null;
                        //     // Get.offAll(() => const NavigationHomeScreen());
                        //   },
                        //   child: RichText(
                        //     text: TextSpan(
                        //       children: <TextSpan>[
                        //         TextSpan(
                        //           text: 'guest_login'.tr,
                        //           style: TextStyle(
                        //             fontSize: 14.sp,
                        //             fontFamily: AppFonts.tajawalExtraBold,
                        //             color: AppColors.primaryColor,
                        //             fontWeight: FontWeight.bold,
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
