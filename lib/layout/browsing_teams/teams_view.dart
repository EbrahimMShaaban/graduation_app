import 'package:flutter/material.dart';
import 'package:login_app1/layout/browsing_teams/team_discription.dart';
import 'package:login_app1/shared/components/components.dart';
import 'package:login_app1/shared/components/constants.dart';
import 'package:login_app1/shared/styles/styles.dart';

import 'browse_view.dart';

class TeamView extends StatelessWidget {
  const TeamView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      //color: Colors.greenAccent,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          SizedBox(
              height: MediaQueryHelper.sizeFromHeight(context, 15),
              child: Text(
                "General",
                style: AppTextStyles.boldtitles,
              )),
          Container(
            // color: Colors.black,
            width: MediaQueryHelper.sizeFromWidth(context, 2),
            height: MediaQueryHelper.sizeFromHeight(context, 1.1),
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return TeamsName(
                      name: "name",
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => TeamDiscription()));
                      });
                }),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: Center(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("return"),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
