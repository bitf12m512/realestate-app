import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:realestate/splash_screen.dart';
import 'Constants/constants.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(
    // ChangeNotifierProvider<RoleIdentifier>(
    // create: (context)=>RoleIdentifier(),
    // child:
    MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor:Constant.appColor,
            fontFamily: 'Poppins',
            accentColor: Constant.blueColor),
        home: SplashScreen()
    ),
  // ),
  );
}