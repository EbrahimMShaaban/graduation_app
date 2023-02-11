import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app1/layout/browsing_teams/team_discription.dart';
import 'package:login_app1/layout/home/cubit/team_cubit.dart';
import 'package:login_app1/models/allteams_model.dart';
import 'package:login_app1/shared/components/components.dart';
import 'package:login_app1/shared/components/constants.dart';
import 'package:login_app1/shared/styles/styles.dart';

class TeamView extends StatelessWidget {
  const TeamView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TeamCubit, TeamStates>(
        builder: (context, state) {
          AllTeams? teamCubit = TeamCubit.get(context).allTeamsmodel;
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
                     // itemCount: teamCubit?.teams?.length,
                    itemCount: 5,
                      itemBuilder: (context, index) {
                        print(teamCubit?.teams?.length);
                        print("teeeeeeeeeems is${teamCubit?.teams}");
                        return TeamsName(
                            name: "${teamCubit?.teams?[index].attributes!.type}",
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
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
        },
        listener: (context, state) {});
  }
}
