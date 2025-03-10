import 'package:fizz/app_imports.dart';

class WithdrawScreen extends StatelessWidget {
  const WithdrawScreen({super.key});

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
              title: Text('سحب الرصيد'),
              leading: ArrowBack(),
              elevation: 0.0,
            ),
            SliverToBoxAdapter(
              child: GetBuilder(
                init: WithDrawController(),
                builder: (withdrawController) => Column(
                  children: [
                    Image.asset(
                      AppAssets.visa,
                      width: 150.w,
                      height: 150.h,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    WithdrawTextField(
                      controller: withdrawController.bankName,
                      hintText: 'اسم البنك',
                    ).paddingSymmetric(horizontal: 15.w),
                    SizedBox(
                      height: 15.h,
                    ),
                    WithdrawTextField(
                      controller: withdrawController.bankOwnerName,
                      hintText: 'اسم صاحب البطاقة',
                    ).paddingSymmetric(horizontal: 15.w),
                    SizedBox(
                      height: 15.h,
                    ),
                    WithdrawTextField(
                      controller: withdrawController.bankNumber,
                      hintText: 'رقم البطاقة',
                    ).paddingSymmetric(horizontal: 15.w),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: WithdrawTextField(
                            keyboardType: TextInputType.number,
                            controller: withdrawController.iBANNumber,
                            hintText: 'Iban',
                          ),
                        ),
                        SizedBox(
                          width: 15.h,
                        ),
                        Expanded(
                          child: WithdrawTextField(
                            keyboardType: TextInputType.number,
                            controller: withdrawController.amount,
                            hintText: 'المبلغ',
                          ),
                        )
                      ],
                    ).paddingSymmetric(horizontal: 15.w),
                    SizedBox(
                      height: 40.h,
                    ),
                    Obx(
                      () => withdrawController.stages.value ==
                              WithDrawControllerStages.loading
                          ? GeneralLoader()
                          : GeneralButton(
                                  buttonColor: AppColors.primaryColor,
                                  height: 40.h,
                                  title: 'سحب الان',
                                  onTap: () {
                                    withdrawController.addWithdraw(context);
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
