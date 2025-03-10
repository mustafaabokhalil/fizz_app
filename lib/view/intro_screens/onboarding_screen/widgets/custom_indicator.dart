import 'package:fizz/app_imports.dart';

class OnBoardingGradientPageIndicator extends StatelessWidget {
  final int pageCount;
  final int currentIndex;

  const OnBoardingGradientPageIndicator({
    super.key,
    required this.pageCount,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          width: currentIndex == index ? 50.0.w : 50.0.w,
          height: 3.0.h,
          decoration: BoxDecoration(
            gradient: currentIndex == index
                ? const LinearGradient(
                    colors: [
                      AppColors.primaryColor,
                      AppColors.primaryColor,
                    ],
                  )
                : const LinearGradient(
                    colors: [Colors.grey, Colors.grey],
                  ),
            borderRadius: BorderRadius.circular(0.0.r),
          ),
        );
      }),
    ).marginSymmetric(vertical: 10.0.h);
  }
}
