import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_app1/shared/components/constants.dart';

import 'layout/start_page.dart';
import 'shared/network/remote/dio_helper.dart';

void main() async {
  await DioHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      // statusBarColor: Colors.white, //or set color with: Color(0xFF0000FF)
      statusBarColor: Color(0x00FFFFFF),

      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For iOS (dark icons)
    ));
    return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: primarycolor,
          primarySwatch: materialColor,
        ),
        home: StartPage());
  }
}
