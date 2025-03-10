import 'dart:io';
import 'dart:math';
import 'package:fizz/app_imports.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui' as ui;
import 'dart:math' show atan2, cos, pi, sin, sqrt;

class AppFunctions {
  static Future<bool> showExitPopup() async {
    // set up the buttons
    Widget cancelButton = Container(
      height: 40.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.primaryColor)),
      child: TextButton(
        child: Text(
          "لا".tr,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          Get.back();
        },
      ),
    );
    Widget continueButton = InkWell(
      onTap: () {
        exit(0);
      },
      child: Container(
        width: 100.w,
        height: 40.h,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            "نعم".tr,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Column(
        children: [
          Container(
            width: 60.w,
            height: 60.h,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.close,
              color: Colors.white,
              size: 40,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "هل تريد الخروج من التطبيق؟",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Expanded(child: cancelButton),
              SizedBox(
                width: 10.w,
              ),
              Expanded(child: continueButton),
            ],
          )
        ],
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
    );

    // show the dialog
    return await showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static Future<void> customAlert({
    required context,
    required Widget body,
  }) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: body);
        });
  }

  static void openBottomSheet(BuildContext context, Widget body) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: body,
      ),
    );
  }

  static showSnackBar({
    required BuildContext context,
    required String message,
    Duration? duration,
    DismissType? dismissType,
    SnackBarPosition? snackBarPosition,
    double? verticalPadding,
  }) {
    showTopSnackBar(
      Overlay.of(context),
      dismissType: dismissType ?? DismissType.onSwipe,
      snackBarPosition: snackBarPosition ?? SnackBarPosition.top,
      displayDuration: duration ?? const Duration(milliseconds: 1500),
      padding: EdgeInsets.symmetric(
          horizontal: 40.w, vertical: verticalPadding ?? 50.w),
      SizedBox(
        width: double.infinity,
        height: 50.w,
        child: CustomSnackBar.success(
          borderRadius: BorderRadius.circular(15.r),
          // boxShadow: [BoxShadow(color: AppColors.primaryColor, offset: const Offset(.5, -.1), spreadRadius: .2, blurRadius: 3)],
          icon: const SizedBox.shrink(),
          message: message,
          messagePadding: REdgeInsets.all(5.r),
          backgroundColor: AppColors.primaryColor.withOpacity(.9),
          textAlign: TextAlign.center,
          textStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  static showErrorSnackBar({
    required BuildContext context,
    required String message,
    Duration? duration,
    DismissType? dismissType,
    SnackBarPosition? snackBarPosition,
    double? verticalPadding,
  }) {
    showTopSnackBar(
      Overlay.of(context),
      dismissType: dismissType ?? DismissType.onSwipe,
      snackBarPosition: snackBarPosition ?? SnackBarPosition.bottom,
      displayDuration: duration ?? const Duration(milliseconds: 1500),
      padding: EdgeInsets.symmetric(
          horizontal: 40.w, vertical: verticalPadding ?? 50.w),
      SizedBox(
        width: double.infinity,
        height: 50.w,
        child: CustomSnackBar.success(
          borderRadius: BorderRadius.circular(15.r),
          icon: const SizedBox.shrink(),
          message: message,
          messagePadding: REdgeInsets.all(5.r),
          backgroundColor: Colors.red.withOpacity(.9),
          textAlign: TextAlign.center,
          textStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  static showAlertDialogLocationNoAvaliavble(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          iconColor: Colors.transparent,
          insetPadding: EdgeInsets.zero,
          content: Container(
            width: 240.w,
            height: 120.w,
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Transform.scale(
                    scale: 1.sp,
                    child: Image.asset(
                      AppAssets.alert,
                      height: 50.h,
                      color: AppColors.primaryColor,
                    )),
                Text(
                  Get.locale!.languageCode == 'en'
                      ? 'Sorry, this area is outside our service area'
                      : 'نأسف هذه المنطقة خارج نطاق خدمتنا',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    Navigator.of(context).pop;
  }

  static double calculateDistance(LatLng p1, LatLng p2) {
    const double radius = 6371000; // Earth's radius in meters
    double lat1 = p1.latitude * pi / 180.0;
    double lon1 = p1.longitude * pi / 180.0;
    double lat2 = p2.latitude * pi / 180.0;
    double lon2 = p2.longitude * pi / 180.0;

    double dLat = lat2 - lat1;
    double dLon = lon2 - lon1;

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(lat1) * cos(lat2) * sin(dLon / 2) * sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return radius * c;
  }

  static Future<Uint8List> getBytesFromAssets(
      {required String path, required int height, required int width}) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: height, targetWidth: width);
    ui.FrameInfo frameInfo = await codec.getNextFrame();
    return (await frameInfo.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  // static double customCalculateDistance(
  //     double lat1, double lon1, double lat2, double lon2) {
  //   const double earthRadius = 6371; // Radius of the Earth in kilometers

  //   double dLat = AppFunctions.toRadians(lat2 - lat1);
  //   double dLon = AppFunctions.toRadians(lon2 - lon1);

  //   double a = sin(dLat / 2) * sin(dLat / 2) +
  //       cos(AppFunctions.toRadians(lat1)) *
  //           cos(AppFunctions.toRadians(lat2)) *
  //           sin(dLon / 2) *
  //           sin(dLon / 2);

  //   double c = 2 * atan2(sqrt(a), sqrt(1 - a));

  //   return earthRadius * c; // Distance in kilometers
  // }

  static double toRadians(double degree) {
    return degree * pi / 180;
  }

  static String getSettingName(name) {
    final setting = Get.find<SettingsController>();
    String? newName;
    setting.settings.forEach((element) {
      if (element.name == name) {
        element.name == name;
        newName = element.value.toString();
      }
    });
    return newName!;
  }

  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneUri';
    }
  }

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(Uri.parse(googleUrl));
    } else {
      throw 'Could not open the map.';
    }
  }

  static void launchWhatsapp({required number, required message}) async {
    var url = Uri.parse("whatsapp://send?phone=$number&text=$message");
    if (await launchUrl(url)) {
      await canLaunchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<double> customCalculateDistance(
      double lat1, double lon1, double lat2, double lon2) async {
    double _distanceInKm = 0.0;

    double distanceInMeters = Geolocator.distanceBetween(
      lat1,
      lon1,
      lat2,
      lon2,
    );

    _distanceInKm = await distanceInMeters / 1000;
    print('${_distanceInKm} dfsdfsdf');
    return _distanceInKm;
  }
}
