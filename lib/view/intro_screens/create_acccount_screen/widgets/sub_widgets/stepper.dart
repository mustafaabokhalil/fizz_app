import 'package:fizz/app_imports.dart';
import 'package:fizz/view/intro_screens/create_acccount_screen/widgets/sub_widgets/custom_Sttepper_text.dart';
import 'package:fizz/view/intro_screens/create_acccount_screen/widgets/sub_widgets/rounded_stepper_container.dart';

class StepperWidget extends StatelessWidget {
  const StepperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Row(
            children: [
              RoundedStepperContainer(
                title: '1',
                isActive:
                    Get.find<CreateAccountController>().registerIndex.value ==
                        0,
              ),
              Expanded(
                  child: Divider(
                thickness: 1.5.sp,
              )),
              RoundedStepperContainer(
                title: '2',
                isActive:
                    Get.find<CreateAccountController>().registerIndex.value ==
                        1,
              ),
              Expanded(
                  child: Divider(
                thickness: 1.5.sp,
              )),
              RoundedStepperContainer(
                title: '3',
                isActive:
                    Get.find<CreateAccountController>().registerIndex.value ==
                        2,
              ),
            ],
          ).paddingSymmetric(horizontal: 25.w),
          SizedBox(
            height: 20.w,
          ),
          Row(
            children: [
              CustomStepperText(
                title: 'المعلومات الشخصية',
                isActive:
                    Get.find<CreateAccountController>().registerIndex.value ==
                        0,
              ),
              const Expanded(child: Divider()),
              CustomStepperText(
                title: 'معلومات السياره',
                isActive:
                    Get.find<CreateAccountController>().registerIndex.value ==
                        1,
              ),
              const Expanded(child: Divider()),
              CustomStepperText(
                title: 'معلومات التسجيل',
                isActive:
                    Get.find<CreateAccountController>().registerIndex.value ==
                        2,
              ),
            ],
          ).paddingSymmetric(horizontal: 15.w),
        ],
      ),
    );
  }
}
