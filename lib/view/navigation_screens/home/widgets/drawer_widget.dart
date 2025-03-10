import 'package:fizz/app_imports.dart';
import 'package:fizz/controller/delete_account_controller.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(150.r),
              bottomRight: Radius.circular(150.r))),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: 0.0,
              right: 0.0,
              child: Center(
                child: Image.asset(
                  AppAssets.splashTopShape,
                  width: 1.sw,
                  height: 1.sh / 1.9,
                  fit: BoxFit.cover,
                ),
              )),
          Align(
            alignment: AlignmentDirectional.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Image.asset(
                  AppAssets.splashLogo,
                  width: 100.w,
                ),
                SizedBox(
                  height: 40.h,
                ),
                DrawerTile(
                  onTap: () {
                    Get.to(() => const PrivacyScreen());
                  },
                  title: 'سياسة الخصوصية',
                ),
                SizedBox(
                  height: 15.h,
                ),
                DrawerTile(
                  onTap: () {
                    Get.to(() => const TermsScreen());
                  },
                  title: 'الشروط والاحكام',
                ),
                SizedBox(
                  height: 15.h,
                ),
                DrawerTile(
                  onTap: () {
                    Get.to(() => const AboutAppScreen());
                  },
                  title: 'عن التطبيق',
                ),
                SizedBox(
                  height: 15.h,
                ),
                DrawerTile(
                  onTap: () {
                    Get.to(() => const ContactUs());
                  },
                  title: 'تواصل معنا',
                ),
                SizedBox(
                  height: 15.h,
                ),
                DrawerTile(
                  onTap: () {
                    AppFunctions.customAlert(
                        context: context,
                        body: Container(
                          width: 1.sw - 100,
                          height: 120.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'deleteAccount'.tr,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                ),
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: GeneralButton(
                                          buttonColor: AppColors.primaryColor,
                                          height: 30.h,
                                          title: 'yes'.tr,
                                          onTap: () {
                                            Get.back();
                                            Get.find<DeleteAccountController>()
                                                .deleteAccount();
                                          },
                                          width: double.maxFinite),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Expanded(
                                      child: GeneralButton(
                                        height: 30.h,
                                        title: 'no'.tr,
                                        onTap: () {
                                          Get.back();
                                        },
                                        width: double.maxFinite,
                                        buttonColor: AppColors.primaryColor
                                            .withOpacity(0.5),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ));
                  },
                  title: 'حذف الحساب',
                ),
                SizedBox(
                  height: 15.h,
                ),
                DrawerTile(
                  onTap: () {
                    LocalStorage.clearAllData();
                    Get.to(() => LoginScreen());
                  },
                  title: 'تسجيل الخروج',
                )
                //
              ],
            ),
          ),
          Positioned(
            bottom: 50.h,
            child: Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
