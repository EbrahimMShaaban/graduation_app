import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app1/layout/home/view/add_a_team/view.dart';
import 'package:login_app1/shared/components/navigator.dart';
import '../../../../shared/components/components.dart';

class DontHaveTeame extends StatelessWidget {
  const DontHaveTeame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "You don’t have \n a team yet",
                    style: TextStyle(fontSize: 35),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  NavigateToOption(
                    name: "Add a team",
                    onPressed: () {
                      navigateTo(context, AddTeam());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


