import 'package:fizz/app_imports.dart';
import 'package:fizz/controller/online_offline_controller.dart';
import 'package:fizz/view/navigation_screens/home/widgets/onlin_offline_widget.dart';

class UserDataWidget extends StatefulWidget {
  const UserDataWidget({super.key});

  @override
  State<UserDataWidget> createState() => _UserDataWidgetState();
}

class _UserDataWidgetState extends State<UserDataWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProfileController(),
      builder: (profileController) => Obx(
        () => profileController.getProfileDataStates.value ==
                ProfileControllerStates.loading
            ? SizedBox()
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),
                        child: Container(
                          width: 50.w,
                          height: 45.h,
                          color: Colors.amber,
                          child: CustomNetworkImage(
                            imageUrl: profileController.user.value!.image,
                            fit: BoxFit.fill,
                            width: 50.w,
                            height: 50.h,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -3.w,
                        left: 0.0,
                        child: OnlineOfflineWidget(
                          color: profileController.isOnline.value
                              ? Colors.green
                              : Colors.red,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profileController.user.value!.name!,
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        profileController.user.value!.phone!,
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Switch(
                      value: profileController.isOnline.value,
                      activeColor: Colors.green,
                      inactiveTrackColor: Colors.red,
                      inactiveThumbColor: Colors.red.withOpacity(0.5),
                      onChanged: (value) {
                        Get.find<OnlineOfflineController>()
                            .onlineOffline(context);
                        profileController.isOnline.value =
                            !profileController.isOnline.value;
                      })
                ],
              ).paddingSymmetric(horizontal: 15.w),
      ),
    );
  }
}
