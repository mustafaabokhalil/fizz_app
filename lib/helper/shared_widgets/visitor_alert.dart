import 'package:fizz/app_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VisitorAlert extends StatelessWidget {
  const VisitorAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 180.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 0.h,
          ),
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                AppAssets.loginIcon,
                width: 40.w,
              ),
            ),
          ),
          Text(
            'please_login'.tr,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  child: GeneralButton(
                      buttonColor: AppColors.primaryColor,
                      height: 30.h,
                      title: 'login'.tr,
                      fontSize: 14.sp,
                      onTap: () {
                        Get.back();
                        // Get.offAll(() => const LoginScreen());
                      },
                      width: 1.sw),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  child: GeneralButton(
                      buttonColor: AppColors.primaryColor.withOpacity(0.6),
                      height: 30.h,
                      title: Get.locale!.languageCode == 'en'
                          ? 'Continue browsing'
                          : 'إستكمال التصفح'.tr,
                      onTap: () {
                        Get.back();
                      },
                      fontSize: 14.sp,
                      width: 1.sw),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
