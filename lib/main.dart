import 'package:car_booking_owner/Classes/manage_data.dart';
import 'package:car_booking_owner/Controllers/app_initialbinding.dart';
import 'package:car_booking_owner/I18n/Translation.dart';
import 'package:car_booking_owner/Preferences/sharedpreferences.dart';
import 'package:car_booking_owner/Res/Services/appconfig.dart';
import 'package:car_booking_owner/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'Utils/Routes/routes.dart';

late ConstantSheet manageData;
Prefs prefrance = Prefs.instance;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await prefrance.setPreferences();
   await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
 );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        manageData = ConstantSheet.instance;
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            appBarTheme: AppBarTheme(
              backgroundColor: manageData.appColors.bgclr,
              elevation: 0,
              foregroundColor: Colors.black,
            ),
            scaffoldBackgroundColor: manageData.appColors.bgclr,
            useMaterial3: false,
          ),
          initialBinding: AppInitialbinding(),
          initialRoute: "/",
          getPages: appRoutes,
          translations: Languages(),
          fallbackLocale: Languages.fallbacklocale,
        );
      },
      designSize: Size(AppConfig.screenWidth, AppConfig.screenHeight),
    );
  }
}
