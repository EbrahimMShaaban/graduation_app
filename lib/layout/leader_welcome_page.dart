import 'package:flutter/material.dart';
import 'package:login_app1/Controllers/Login_cubit/logincubit.dart';
import 'package:login_app1/models/User.dart';
import 'package:login_app1/shared/components/components.dart';
import 'package:login_app1/shared/components/constants.dart';

class LeaderWelcomePage extends StatelessWidget {
  LeaderWelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome,",
                    style: TextStyle(fontSize: 40),
                  ),
                  Text(User.name,
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Column(
              children: [
                NavigateToOption(
                  name: "Your Team",
                  onPressed: () {},
                ),
                NavigateToOption(
                  name: "Browse Teams",
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

