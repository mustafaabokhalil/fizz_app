import 'dart:developer';
import 'dart:io';

import 'package:fizz/app_imports.dart';
import 'package:fizz/view/intro_screens/create_acccount_screen/widgets/sub_widgets/cities_dropdwon.dart';
import 'package:fizz/view/intro_screens/create_acccount_screen/widgets/sub_widgets/custom_dotted_circle.dart';
import 'package:fizz/view/intro_screens/create_acccount_screen/widgets/sub_widgets/geneder_bottom_sheet.dart';
import 'package:fizz/view/intro_screens/create_acccount_screen/widgets/sub_widgets/nationality_dropdown.dart';
import 'package:fizz/view/intro_screens/create_acccount_screen/widgets/sub_widgets/stepper.dart';

class RegisterStepOne extends StatelessWidget {
  const RegisterStepOne({super.key});

  @override
  Widget build(BuildContext context) {
    final registerController = Get.find<CreateAccountController>();
    return Container(
      width: 1.sw,
      height: 1.sh,
      child: Stack(
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
          Container(
            width: 1.sw,
            height: 1.sh,
            child: CustomScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              slivers: [
                SliverToBoxAdapter(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          AppAssets.registerVector,
                          height: 0.2.sh,
                          width: 1.sw - 20,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'التسجيل',
                          style: TextStyle(
                              color: Colors.red,
                              fontFamily: AppFonts.tajawalExtraBold,
                              fontSize: 18.sp),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const StepperWidget(),
                        SizedBox(
                          height: 10.h,
                        ),
                        GetBuilder(
                          init: ImagePickerController(),
                          builder: (imagePickerController) => InkWell(
                            onTap: () {
                              imagePickerController.showPicker(
                                  context, 'personal');
                            },
                            child: SizedBox(
                              width: 90.w,
                              height: 80.h,
                              child: CustomPaint(
                                size: Size(80, 80),
                                painter: DottedCirclePainter(),
                                child: Obx(
                                  () => registerController
                                              .personalImage!.value !=
                                          null
                                      ? ClipOval(
                                          child: Image.file(
                                            File(
                                              registerController
                                                  .personalImage!.value!.path,
                                            ),
                                            fit: BoxFit.cover,
                                            width: 90.w,
                                            height: 70.h,
                                          ),
                                        )
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              AppAssets.cameraIcon,
                                              height: 25.h,
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Text(
                                              'صوره شخصية',
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
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        GeneralTextField(
                          controller: registerController.nameController,
                          icon: AppAssets.signUpUser,
                          hinText: 'الاسم',
                          isPassword: false,
                          keyboardType: TextInputType.name,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        NationalityDropdown()
                            .paddingSymmetric(horizontal: 20.w),
                        SizedBox(
                          height: 10.h,
                        ),
                        CitiesDropDown().paddingSymmetric(horizontal: 20.w),
                        SizedBox(
                          height: 10.h,
                        ),
                        GeneralTextField(
                          controller: registerController.idNumberController,
                          icon: AppAssets.nationalityId,
                          hinText: 'رقم الهوية / الاقامة',
                          isPassword: false,
                          keyboardType: TextInputType.name,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Obx(
                          () => InkWell(
                            onTap: () {
                              registerController.selectDate(context);
                            },
                            child: AbsorbPointer(
                              absorbing: true,
                              child: GeneralTextField(
                                controller:
                                    registerController.birthDayController,
                                icon: AppAssets.signUpUser,
                                hinText: registerController
                                            .selectedDate.value !=
                                        null
                                    ? '${registerController.formatter.format(registerController.selectedDate.value!)}'
                                    : 'سنة الميلاد',
                                isPassword: false,
                                keyboardType: TextInputType.name,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        InkWell(
                          onTap: () {
                            AppFunctions.openBottomSheet(
                              context,
                              GenderBottomSheet(),
                            );
                          },
                          child: Obx(
                            () => AbsorbPointer(
                              child: GeneralTextField(
                                controller: TextEditingController(),
                                icon: AppAssets.signUpUser,
                                hinText:
                                    '${gender[registerController.selectedGenderIndex.value]}',
                                isPassword: false,
                                keyboardType: TextInputType.name,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        GeneralButton(
                          buttonColor: AppColors.primaryColor,
                          height: 40.h,
                          title: 'التالى'.tr,
                          onTap: () {
                            if (registerController.isFormValidStepOne()) {
                              Get.find<CreateAccountController>()
                                  .pageController
                                  .animateToPage(1,
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.bounceIn);
                            } else {
                              AppFunctions.showSnackBar(
                                  context: context,
                                  message:
                                      registerController.getErrorMessage());
                            }
                          },
                          width: 1.sw,
                        ).paddingSymmetric(horizontal: 20.w),
                        SizedBox(
                          height: 20.h,
                        ),
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(
                            'لدى حساب',
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
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 70.h,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
