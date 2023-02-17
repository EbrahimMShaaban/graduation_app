import 'package:flutter/material.dart';
import 'package:login_app1/layout/browsing_teams/teams_view.dart';
import 'package:login_app1/shared/components/constants.dart';
import 'package:login_app1/shared/styles/colors.dart';

import '../../models/User.dart';
import '../../shared/components/components.dart';

class BrowseView extends StatelessWidget {
  const BrowseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          //    mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Browse",
                    style: TextStyle(fontSize: 40),
                  ),
                  Text("Teams",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                  Text("2023/2024",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: AppColors.background)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQueryHelper.sizeFromHeight(context, 4),
            ),
            Column(
              children: [
                NavigateToOption(
                  name: "General",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TeamView(
                                  type: true,
                                )));
                  },
                ),
                NavigateToOption(
                  name: "Credit",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TeamView(
                                  type: false,
                                )));
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
