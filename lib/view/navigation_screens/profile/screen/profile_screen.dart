import 'dart:io';

import 'package:fizz/app_imports.dart';
import 'package:fizz/view/navigation_screens/profile/controller/update_profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> profileScreenScaffoldKey =
        GlobalKey<ScaffoldState>();
    return Scaffold(
      key: profileScreenScaffoldKey,
      drawer: const DrawerWidget(),
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
            init: EditProfileController(),
            builder: (controller) => CustomScrollView(
              slivers: [
                SliverAppBar(
                  toolbarHeight: 60.h,
                  backgroundColor: Colors.transparent,
                  leading: Transform.scale(
                    scale: 0.5,
                    child: InkWell(
                      onTap: () {
                        profileScreenScaffoldKey.currentState!.openDrawer();
                      },
                      child: Image.asset(
                        AppAssets.menu,
                        width: 25.w,
                      ),
                    ),
                  ),
                  centerTitle: true,
                  title: Text(
                    'حسابي',
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                  actions: [
                    SizedBox(
                      width: 12.w,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => const NotificationScreen());
                      },
                      child: Image.asset(
                        AppAssets.notifications,
                        width: 25.w,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    )
                  ],
                ),
                SliverToBoxAdapter(
                    child: GetBuilder(
                  init: ProfileController(),
                  builder: (profileController) => Obx(
                    () => profileController.getProfileDataStates.value ==
                            ProfileControllerStates.loading
                        ? SizedBox(
                            width: 1.sw,
                            height: 0.8.sh,
                            child: GeneralLoader(),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GetBuilder(
                                      init: ImagePickerController(),
                                      builder: (imagePickerController) =>
                                          imagePickerController
                                                      .personalImageFile !=
                                                  null
                                              ? ClipOval(
                                                  child: Image.file(
                                                    File(
                                                      imagePickerController
                                                          .personalImageFile!
                                                          .path,
                                                    ),
                                                    fit: BoxFit.fill,
                                                    width: 70.w,
                                                    height: 60.h,
                                                  ),
                                                )
                                              : InkWell(
                                                  onTap: () {
                                                    imagePickerController
                                                        .showPicker(context,
                                                            'personal');
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.r),
                                                    child: Container(
                                                      width: 70.w,
                                                      height: 60.h,
                                                      color: Colors.amber,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    100.r),
                                                        child:
                                                            CustomNetworkImage(
                                                          imageUrl:
                                                              profileController
                                                                  .user
                                                                  .value!
                                                                  .image,
                                                          width: 90.w,
                                                          height: 70.h,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          '${profileController.user.value!.name}',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '${profileController.user.value!.phone}',
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                'الاسم',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ).paddingSymmetric(
                                horizontal: 30.w,
                                vertical: 5.h,
                              ),
                              GeneralTextField(
                                controller: controller.nameController,
                                icon: AppAssets.signUpUser,
                                hinText: 'الاسم',
                                isPassword: false,
                                keyboardType: TextInputType.name,
                              ),
                              // SizedBox(
                              //   height: 10.h,
                              // ),
                              // Text(
                              //   'الجنسيه',
                              //   style: TextStyle(
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ).paddingSymmetric(
                              //   horizontal: 30.w,
                              //   vertical: 5.h,
                              // ),
                              // GeneralTextField(
                              //   controller: controller.nationalityController,
                              //   icon: AppAssets.nationality,
                              //   hinText: 'الجنسيه',
                              //   isPassword: false,
                              //   keyboardType: TextInputType.name,
                              // ),
                              // SizedBox(
                              //   height: 10.h,
                              // ),
                              // GeneralTextField(
                              //   controller: TextEditingController(),
                              //   icon: AppAssets.city,
                              //   hinText: 'المدينة',
                              //   inputFormatters: [
                              //     LengthLimitingTextInputFormatter(
                              //         10), //n is maximum number of characters you want in textfield
                              //   ],
                              //   isPassword: false,
                              //   keyboardType: TextInputType.name,
                              // ),
                              // SizedBox(
                              //   height: 10.h,
                              // ),
                              // GeneralTextField(
                              //   controller: TextEditingController(),
                              //   icon: AppAssets.nationalityId,
                              //   hinText: 'رقم الهوية / الاقامة',
                              //   isPassword: false,
                              //   keyboardType: TextInputType.name,
                              // ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                'سنة الميلاد',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ).paddingSymmetric(
                                horizontal: 30.w,
                                vertical: 5.h,
                              ),

                              InkWell(
                                onTap: () {
                                  controller.selectDate(context);
                                },
                                child: AbsorbPointer(
                                  absorbing: true,
                                  child: GeneralTextField(
                                    controller: controller.birthday,
                                    icon: AppAssets.signUpUser,
                                    hinText: '${controller.birthday}',
                                    isPassword: false,
                                    keyboardType: TextInputType.name,
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                'رقم الجوال',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ).paddingSymmetric(
                                horizontal: 30.w,
                                vertical: 5.h,
                              ),
                              AbsorbPointer(
                                absorbing: true,
                                child: GeneralTextField(
                                  controller: controller.phoneController,
                                  icon: AppAssets.callIcons,
                                  hinText: 'رقم الجوال',
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(
                                        10), //n is maximum number of characters you want in textfield
                                  ],
                                  isPassword: false,
                                  keyboardType: TextInputType.name,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                'الايميل',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ).paddingSymmetric(
                                horizontal: 30.w,
                                vertical: 5.h,
                              ),
                              GeneralTextField(
                                controller: controller.emailController,
                                icon: AppAssets.email,
                                hinText: 'الايميل',
                                isPassword: false,
                                keyboardType: TextInputType.name,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Obx(
                                () => controller.editProfileStates.value ==
                                        EditProfileStates.loading
                                    ? GeneralLoader()
                                    : GeneralButton(
                                            buttonColor: AppColors.primaryColor,
                                            height: 40.h,
                                            title: 'تعديل',
                                            onTap: () {
                                              controller
                                                  .updateProfileData(context);
                                            },
                                            width: 1.sw)
                                        .paddingSymmetric(horizontal: 20.w),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                            ],
                          ),
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
