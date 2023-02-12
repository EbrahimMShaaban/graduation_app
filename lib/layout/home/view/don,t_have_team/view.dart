import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app1/layout/home/view/add_a_team/view.dart';
import 'package:login_app1/shared/components/navigator.dart';
import '../../../../shared/components/constants.dart';

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

class NavigateToOption extends StatelessWidget {
  NavigateToOption({Key? key, required this.name, required this.onPressed})
      : super(key: key);
  String name;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: SizedBox(
          height: 70,
          width: 320,
          child: InkWell(
            onTap: onPressed,
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: primarycolor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    Text(name,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
