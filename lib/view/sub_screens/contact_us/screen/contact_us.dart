import 'package:fizz/app_imports.dart';
import 'package:fizz/view/sub_screens/contact_us/controller/contact_us_controller.dart';
import 'package:fizz/view/sub_screens/withdraw_screen/widgets/withdraw_text_field.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
            top: 0.0,
            right: 0.0,
            child: Image.asset(
              AppAssets.splashTopShape,
              width: 1.sw,
            )),
        CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              title: Text('تواصل معنا'),
              leading: ArrowBack(),
              elevation: 0.0,
            ),
            SliverToBoxAdapter(
              child: GetBuilder(
                init: ContactUsController(),
                builder: (controller) => Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    WithdrawTextField(
                      controller: controller.phone,
                      hintText: 'رقم الجوال',
                    ).paddingSymmetric(horizontal: 15.w),
                    SizedBox(
                      height: 15.h,
                    ),
                    WithdrawTextField(
                      controller: controller.email,
                      hintText: 'البريد الالكترونى',
                    ).paddingSymmetric(horizontal: 15.w),
                    SizedBox(
                      height: 15.h,
                    ),
                    WithdrawTextField(
                      height: 150.h,
                      controller: controller.message,
                      hintText: 'رسالتك',
                    ).paddingSymmetric(horizontal: 15.w),
                    SizedBox(
                      height: 40.h,
                    ),
                    Obx(
                      () => controller.stages.value ==
                              ContactUsControllerStages.loading
                          ? GeneralLoader()
                          : GeneralButton(
                                  buttonColor: AppColors.primaryColor,
                                  height: 40.h,
                                  title: 'ارسال الان',
                                  onTap: () {
                                    controller.addContactUs(context);
                                  },
                                  width: 1.sw)
                              .paddingSymmetric(horizontal: 15.w),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
