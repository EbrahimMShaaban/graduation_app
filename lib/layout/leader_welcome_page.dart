import 'package:flutter/material.dart';
import 'package:login_app1/Controllers/Login_cubit/logincubit.dart';
import 'package:login_app1/layout/browsing_teams/browse_view.dart';
import 'package:login_app1/layout/home/view/add_a_team/view.dart';
import 'package:login_app1/layout/home/view/don,t_have_team/view.dart';
import 'package:login_app1/layout/home/view/yourTeam/view.dart';
import 'package:login_app1/layout/start_page.dart';
import 'package:login_app1/models/User.dart';
import 'package:login_app1/models/model_myteam.dart';
import 'package:login_app1/shared/components/components.dart';
import 'package:login_app1/shared/components/constants.dart';
import 'package:login_app1/shared/components/navigator.dart';
import 'package:login_app1/shared/network/remote/end_points.dart';

import '../shared/network/local/shared_preferences.dart';
import '../shared/styles/colors.dart';
import 'home/widgets/Text_Button.dart';

class LeaderWelcomePage extends StatefulWidget {
  LeaderWelcomePage({Key? key}) : super(key: key);

  @override
  State<LeaderWelcomePage> createState() => _LeaderWelcomePageState();
}

class _LeaderWelcomePageState extends State<LeaderWelcomePage> {
  bool _isShown = true;

  void _delete(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Are You Sure you want to logout? '),
            // content: const Text('Are you sure to remove the box?'),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () {
                    // Remove the box
                    setState(() {
                      _isShown = false;
                    });
                    signout(context);
                    // Close the dialog
                  },
                  child: const Text(
                    'Yes',
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    print(myName);
    print(token);
    print(team_id);
    return Scaffold(

      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: _isShown == true ? () => _delete(context) : null,
              icon: Icon(
                Icons.logout_sharp,
                color: primarycolor,
              ))
        ],
      ),
      body: User.name != null || myName != null
          ? Container(
              child: Center(
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
                          Text(myName,
                              style: TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.bold)),
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
                            if (team_id == "null") {
                              return navigateTo(context, DontHaveTeame());
                            } else {
                              return navigateTo(context, YourTeamScreen());
                            }
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
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

void signout(context) {
  CacheHelper.removeToken(key: 'token').then((value) {
    CacheHelper.removeToken(key: 'name');
    CacheHelper.removeToken(key: 'team_id');
    navigateAndFinished(context, StartPage());
  });
}
