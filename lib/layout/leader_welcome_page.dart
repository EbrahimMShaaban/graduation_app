import 'package:flutter/material.dart';
import 'package:login_app1/Controllers/Login_cubit/logincubit.dart';
import 'package:login_app1/layout/home/view/add_a_team/view.dart';
import 'package:login_app1/layout/home/view/yourTeam/view.dart';
import 'package:login_app1/models/User.dart';
import 'package:login_app1/models/model_myteam.dart';
import 'package:login_app1/shared/components/components.dart';
import 'package:login_app1/shared/components/constants.dart';
import 'package:login_app1/shared/components/navigator.dart';

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
                  onPressed: () {
                    navigateTo(context, AddTeam());
                  },
                ),
                NavigateToOption(
                  name: "Browse Teams",
                  onPressed: () {
                    navigateTo(context, YourTeamScreen());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NavigateToOption extends StatelessWidget {
  NavigateToOption({Key? key, required this.name, required this.onPressed})
      : super(key: key);
  String name;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 70,
        width: 320,
        child: Material(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: [
                Text(name,
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                Spacer(),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: MaterialButton(
                      padding: EdgeInsets.zero,
                      color: primarycolor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      onPressed: onPressed),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
