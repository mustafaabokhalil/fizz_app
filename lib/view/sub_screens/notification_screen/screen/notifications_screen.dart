import 'package:fizz/app_imports.dart';
import 'package:fizz/view/sub_screens/notification_screen/controller/notification_controller.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NotificationsController(),
      builder: (controller) => Scaffold(
        body: Stack(children: [
          Positioned(
            top: 0.0,
            right: 0.0,
            child: Image.asset(
              AppAssets.splashTopShape,
              width: 1.sw,
            ),
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                toolbarHeight: 80.h,
                backgroundColor: Colors.transparent,
                leading: const ArrowBack(),
                centerTitle: true,
                title: Text(
                  'الاشعارات',
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                ),
                /*   actions: [
                  SizedBox(
                    width: 12.w,
                  ),
                  Image.asset(
                    AppAssets.menu,
                    width: 25.w,
                  ),
                  SizedBox(
                    width: 10.w,
                  )
                ],
             */
              ),
              Obx(
                () => controller.notificationsStages.value ==
                        notificationsControllerStages.loading
                    ? SliverToBoxAdapter(
                        child: SizedBox(
                            width: 1.sw,
                            height: 0.7.sh,
                            child: Center(
                              child: GeneralLoader(),
                            )),
                      )
                    : controller.notificationResponse.value!.data.notifications
                            .isEmpty
                        ? SliverToBoxAdapter(
                            child: SizedBox(
                                width: 1.sw,
                                height: 0.7.sh,
                                child: Center(
                                    child: Text('لا يوجد اشعارات حاليا'))),
                          )
                        : SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15.r),
                                      border:
                                          Border.all(color: Colors.grey[200]!)),
                                  child: Row(
                                    children: [
                                      CustomNetworkImage(
                                        imageUrl: controller
                                            .notificationResponse
                                            .value!
                                            .data
                                            .notifications[index]
                                            .image,
                                        width: 20.w,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Container(
                                        width: 2.sp,
                                        height: 40.h,
                                        color: Colors.grey[200],
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${controller.notificationResponse.value!.data.notifications[index].title}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                                '${controller.notificationResponse.value!.data.notifications[index].message}'),
                                          ],
                                        ).paddingSymmetric(vertical: 10.h),
                                      ),
                                      Spacer(),
                                      Text(
                                          '${controller.notificationResponse.value!.data.notifications[index].createdAt}'),
                                    ],
                                  ).paddingSymmetric(horizontal: 15.w),
                                ).paddingSymmetric(
                                    horizontal: 15.w, vertical: 5.h);
                              },
                              childCount: controller.notificationResponse.value!
                                  .data.notifications.length,
                            ),
                          ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
