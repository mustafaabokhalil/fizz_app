import 'dart:io';

import 'package:fizz/app_imports.dart';
import 'package:fizz/view/intro_screens/create_acccount_screen/widgets/sub_widgets/custom_dotted_circle.dart';
import 'package:fizz/view/intro_screens/create_acccount_screen/widgets/sub_widgets/stepper.dart';

class RegisterStepTwo extends StatelessWidget {
  const RegisterStepTwo({super.key});

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
                  height: 20.h,
                ),
                Image.asset(
                  AppAssets.carInfoVector,
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
                GetBuilder(
                  init: ImagePickerController(),
                  builder: (imagePickerController) => InkWell(
                    onTap: () {
                      imagePickerController.showPicker(context, 'license');
                    },
                    child: SizedBox(
                      width: 90.w,
                      height: 80.h,
                      child: CustomPaint(
                        size: Size(80, 80),
                        painter: DottedCirclePainter(),
                        child: registerController.licenseImage!.value != null
                            ? ClipOval(
                                child: Image.file(
                                  File(
                                    registerController
                                        .licenseImage!.value!.path,
                                  ),
                                  fit: BoxFit.cover,
                                  width: 90.w,
                                  height: 70.h,
                                ),
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    AppAssets.cameraIcon,
                                    height: 25.h,
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    'صوره الرخصه',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.sp),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                GeneralTextField(
                  controller: registerController.carTypeController,
                  icon: AppAssets.carIcon,
                  hinText: 'نوع السيارة',
                  isPassword: false,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: 10.h,
                ),
                GeneralTextField(
                  controller: registerController.carModelController,
                  icon: AppAssets.carIcon,
                  hinText: 'موديل السيارة',
                  isPassword: false,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: 10.h,
                ),
                GeneralTextField(
                  controller: registerController.carNumberController,
                  icon: AppAssets.nationalityId,
                  hinText: 'رقم السيارة',
                  isPassword: false,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: 30.h,
                ),
                GeneralButton(
                  buttonColor: AppColors.primaryColor,
                  height: 45.h,
                  title: 'التالى'.tr,
                  onTap: () {
                    if (registerController.isFormStepTwoValid()) {
                      Get.find<CreateAccountController>()
                          .pageController
                          .animateToPage(2,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.bounceIn);
                    } else {
                      String errorMessage =
                          registerController.getStepTwoErrorMessage();
                      AppFunctions.showSnackBar(
                          context: context, message: errorMessage);
                    }
                  },
                  width: 1.sw,
                ).paddingSymmetric(horizontal: 20.w),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                  onTap: () {
                    Get.find<CreateAccountController>()
                        .pageController
                        .animateToPage(0,
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
                  height: 50.h,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
