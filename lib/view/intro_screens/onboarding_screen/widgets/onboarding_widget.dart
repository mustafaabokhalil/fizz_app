import 'package:fizz/app_imports.dart';
import 'package:fizz/helper/constants/app_fonts.dart';

class ObboardingWidget extends StatelessWidget {
  const ObboardingWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.index,
  });
  final String image;
  final String title;
  final String subTitle;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          image,
          width: 1.sw,
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            }
          },
          errorBuilder:
              (BuildContext context, Object error, StackTrace? stackTrace) {
            return const Icon(Icons.error);
          },
        ),
        Positioned(
          bottom: 0.0,
          child: Container(
            width: 1.sw,
            height: 220.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  topRight: Radius.circular(15.r),
                ),
                color: Colors.white),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: title,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black,
                          fontFamily: '',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // if (index == 0)
                      //   TextSpan(
                      //     text: 'جود الطازج',
                      //     style: TextStyle(
                      //       fontSize: 14.sp,
                      //       fontFamily: AppFonts.tajawalExtraBold,
                      //       color: AppColors.primaryColor,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                    ],
                  ),
                ),
                Text(
                  subTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: AppFonts.tajawalExtraBold,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      height: 1.8.sp),
                ).paddingSymmetric(horizontal: 15.w, vertical: 20.h),
              ],
            ),
          ),
        )
      ],
    );
  }
}
