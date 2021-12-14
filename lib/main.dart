import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:provider/provider.dart';
import 'package:realestate/Provider/provider_class.dart';
import 'package:realestate/splash_screen.dart';
import 'Constants/constants.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
      EasyLocalization(
        child: MyApp(),
        saveLocale: true,
        // useOnlyLangCode: false,
        supportedLocales: [
          Locale('en'),
          Locale('ar')
        ],
        path: 'Assets', // <-
        // fallbackLocale:Locale('en') ,// - change the path of the translation files

      )

  );
}
class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider<RoleIdentifier>(
      create: (context) => RoleIdentifier(),
      child: InAppNotification(
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: ThemeData(
                scaffoldBackgroundColor: Constant.appColor,
                fontFamily: 'Poppins',
                accentColor: Constant.blueColor),
            home: SplashScreen()),
      ),
    );
  }
}
