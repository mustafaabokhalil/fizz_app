import 'package:fizz/helper/constants/app_aseets.dart';
import 'package:fizz/helper/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    this.imageUrl,
    this.width,
    this.height,
    this.borderRadius,
    this.fit,
  });
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  @override
  Widget build(BuildContext context) {
    return imageUrl!.isEmpty
        ? Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                borderRadius: borderRadius ?? BorderRadius.circular(10),
                color: AppColors.primaryColor.withOpacity(0.2)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                AppAssets.splashLogo,
                width: width,
                height: height,
              ),
            ),
          )
        : Image.network(
            imageUrl!,
            width: width,
            height: height,
            fit: fit,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                // Image has successfully loaded
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor.withOpacity(0.2),
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  ),
                );
              }
            },
            errorBuilder:
                (BuildContext context, Object error, StackTrace? stackTrace) {
              // Handle image loading errors here
              return Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(
                        15)), // Placeholder or alternative image
                child: Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                      borderRadius: borderRadius ?? BorderRadius.circular(10),
                      color: AppColors.primaryColor.withOpacity(0.2)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(
                      AppAssets.splashLogo,
                      width: width,
                      height: height,
                    ),
                  ),
                ),
              );
            },
          );
  }
}
