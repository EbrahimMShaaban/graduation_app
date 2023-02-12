import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app1/layout/home/cubit/team_cubit.dart';
import 'package:login_app1/layout/home/view/add_a_team/view.dart';
import 'package:login_app1/layout/leader_welcome_page.dart';
import 'package:login_app1/models/CreateTeam.dart';
import 'package:login_app1/shared/components/constants.dart';

import 'layout/home/view/yourTeam/view.dart';
import 'layout/start_page.dart';
import 'shared/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => TeamCubit()
            ..createTeam
           // ..getMyTeam()
           // ..getAllTeams(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primaryColor: primarycolor,
            primarySwatch: materialColor,
          ),
          home: StartPage()),
    );
  }
}
