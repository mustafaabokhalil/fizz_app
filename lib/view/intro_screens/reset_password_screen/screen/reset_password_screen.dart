import 'package:fizz/app_imports.dart';
import 'package:fizz/view/intro_screens/reset_password_screen/controller/reset_password_controller.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 0.0,
              right: 0.0,
              child: Image.asset(
                AppAssets.splashTopShape,
                width: 1.sw,
              )),
          GetBuilder(
            init: ResetPasswordController(),
            builder: (controller) => SizedBox(
              width: 1.sw,
              height: 1.sh,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    leading: ArrowBack(),
                    centerTitle: true,
                    title: Text('إعادة تعيين الباسورد'),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('من فضلك ادخل كلمة المرور الجديدة')
                              .paddingSymmetric(
                                  horizontal: 15.w, vertical: 15.h),
                          GeneralTextField(
                            controller: controller.passwordController,
                            icon: AppAssets.lock,
                            hinText: 'كلمة المرور'.tr,
                            isPassword: true,
                            obscureText: controller.isPasswordVisible.value,
                            keyboardType: TextInputType.visiblePassword,
                            suffixIcon: InkWell(
                              onTap: () {
                                controller.isPasswordVisible.value =
                                    !controller.isPasswordVisible.value;
                              },
                              child: Icon(
                                controller.isPasswordVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey[400],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Obx(
                            () => controller.stages.value ==
                                    ResetPasswordControllerStages.loading
                                ? GeneralLoader()
                                : GeneralButton(
                                    buttonColor: AppColors.primaryColor,
                                    height: 45.h,
                                    title: 'ارسال',
                                    onTap: () {
                                      if (controller
                                          .passwordController.text.isNotEmpty) {
                                        controller.resetPassword(context);
                                      }
                                    },
                                    width: 1.sw,
                                  ).paddingSymmetric(
                                    horizontal: 15.w, vertical: 15.h),
                          )
                        ]),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
