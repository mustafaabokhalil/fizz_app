import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:fizz/app_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PusherServices.instance.initializePusher();
  await Future.delayed(const Duration(milliseconds: 300));
  await Firebase.initializeApp();

  await FirebaseMessagingService.instance.initFirebaseMessaging();
  PermissionStatus status = await Permission.notification.status;
  log(status.toString());
  if (!status.isGranted) {
    Permission.notification.request();
  }
  if (Platform.isAndroid) {
    if (status.isDenied) {
      log(status.toString());
      Permission.notification.request();
    }
  }
  await LocalNotificationService.instance.initNotificationSettings();
  FirebaseMessagingService.instance.getDeviceFCMToken();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fizz',
        translations: LanguageKeys(),
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                titleTextStyle: TextStyle(
              fontFamily: 'TajawalBlack',
              fontSize: 14.sp,
              color: Colors.black,
            )),
            fontFamily: AppFonts.tajawalLight),
        locale: const Locale('ar'),
        initialBinding: AppBinding(),
        home: const SplashScreen(),
      ),
    );
  }
}
