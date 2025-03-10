import 'package:fizz/app_imports.dart';

class ReceiveOrdersScreen extends StatelessWidget {
  const ReceiveOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 0.0,
              right: 0.0,
              child: Image.asset(
                AppAssets.splashTopShape,
                width: 1.sw,
              )),
          CustomScrollView(
            slivers: [
              const SliverAppBar(
                leading: ArrowBack(),
                title: Text('استلام'),
                centerTitle: true,
                backgroundColor: Colors.transparent,
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 1.sw,
                      height: 40.h,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Row(
                        children: [
                          Image.asset(
                            AppAssets.marker,
                            height: 20.h,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text('شارع سعد الدين امام الخديوى')
                        ],
                      ).paddingSymmetric(horizontal: 10.w),
                    ).paddingSymmetric(horizontal: 15.w),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      '#1231212',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ).paddingSymmetric(horizontal: 15.w),
                    Container(
                      width: 1.sw,
                      height: 450.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(
                                  0.1), // Shadow color with opacity
                              spreadRadius: 5, // How much the shadow spreads
                              blurRadius:
                                  15, // Smoothness of the shadow (larger = smoother)
                              offset: const Offset(
                                  0, 3), // Changes the shadow position (x, y)
                            ),
                          ],
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: List.generate(
                                3,
                                (index) => Column(
                                      children: [
                                        ListTile(
                                          leading: SizedBox(
                                            width: 40.w,
                                            height: 40.h,
                                            child: ClipOval(
                                              child: Image.network(
                                                'https://images.pexels.com/photos/3434533/pexels-photo-3434533.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                                                fit: BoxFit.fitWidth,
                                              ),
                                            ),
                                          ),
                                          title: Text('بوكس مغلق حجم 2*5'),
                                          subtitle: Text('الوزن: 50كيلو'),
                                          trailing: Text(
                                            'الكمية: 1',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                        Divider(),
                                      ],
                                    )),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'المبلغ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ).paddingSymmetric(horizontal: 15.w),
                          SizedBox(
                            height: 5.h,
                          ),
                          const Text(
                            'تم الدفع بالفيزا',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ).paddingSymmetric(horizontal: 15.w),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Text(
                            'التعليقات',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ).paddingSymmetric(horizontal: 15.w),
                          SizedBox(
                            height: 5.h,
                          ),
                          Container(
                            width: 1.sw,
                            height: 100.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(color: Colors.grey[200]!)),
                            child: TextFormField(
                                decoration: const InputDecoration(
                              border: InputBorder.none,
                            )).paddingSymmetric(horizontal: 10.w),
                          ).paddingSymmetric(horizontal: 15.w)
                        ],
                      ),
                    ).paddingSymmetric(horizontal: 15.w),
                    GeneralButton(
                            buttonColor: AppColors.primaryColor,
                            height: 40.h,
                            title: 'استلام',
                            onTap: () {},
                            width: 1.sw)
                        .paddingAll(15.w)
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
