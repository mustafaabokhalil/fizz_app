import 'dart:developer';

import 'package:fizz/app_imports.dart';

class GenderBottomSheet extends StatelessWidget {
  const GenderBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final registerController = Get.find<CreateAccountController>();
    return Container(
      width: 1.sw,
      height: 150.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
            15.r,
          ))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
                alignment: AlignmentDirectional.center,
                child: Text(
                  ' الجنس'.tr,
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.bold),
                )),
          ),
          SizedBox(
            height: 10.h,
          ),
          Column(
            children: List.generate(
                gender.length,
                (index) => Obx(
                      () => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: InkWell(
                          onTap: () {
                            Get.back();
                            registerController.selectedGenderIndex.value =
                                index;
                            log(index.toString());
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 15.w,
                                height: 15.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: Colors.grey[500]!)),
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: registerController
                                                    .selectedGenderIndex
                                                    .value ==
                                                index
                                            ? Colors.black
                                            : Colors.transparent),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                '${gender[index]}',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ).paddingOnly(bottom: 15.r),
                        ),
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}
