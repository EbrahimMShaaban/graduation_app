import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/layout/screens/add_a_team/cubit/my_team_cubit.dart';
import 'package:graduation_app/layout/screens/yourTeam/view.dart';

import 'data/data_resources/remote/dio.dart';
import 'layout/screens/add_a_team/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddTeam(),
    );
  }
}
