
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app1/layout/home/cubit/team_cubit.dart';
import 'package:login_app1/layout/start_page.dart';
import 'package:login_app1/shared/components/constants.dart';
import 'package:login_app1/shared/network/local/shared_preferences.dart';
import 'package:login_app1/shared/network/remote/end_points.dart';
import 'package:login_app1/shared/styles/colors.dart';
import 'layout/leader_welcome_page.dart';
import 'models/User.dart';
import 'shared/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await DioHelper.init();
  await CacheHelper.init();
  final Widget startWidget;
  token = CacheHelper.getData(key: 'token');
  name = CacheHelper.getData(key: 'name');
  team_id = CacheHelper.getData(key: 'team_id');

    if (token != null) {
    startWidget = LeaderWelcomePage();
    print(team_id);
    print(token);
    print("تعبت الله الوكيل");
  } else {
    print(User.name);
    print(token);
    print("تعبت");
    startWidget = StartPage();
  }
  runApp(MyApp(
    startWidget: startWidget,
  ));
}

class MyApp extends StatelessWidget {
    final Widget startWidget;

  const MyApp({
    required this.startWidget,
  });

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
        BlocProvider(create: (BuildContext context) => TeamCubit()
          //..getMyTeam()
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
              appBarTheme: AppBarTheme(
                  color: AppColors.white,
                  elevation: 0,
                  iconTheme: IconThemeData(color: primarycolor))),
          home: startWidget),
    );
  }
}
