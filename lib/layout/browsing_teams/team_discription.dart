import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app1/layout/home/view/editTeam/view.dart';
import 'package:login_app1/models/model_myteam.dart';
import 'package:login_app1/shared/components/navigator.dart';

import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/mu_styal.dart';
import '../home/cubit/team_cubit.dart';


class TeamDiscription extends StatefulWidget {
  const TeamDiscription({Key? key}) : super(key: key);

  @override
  State<TeamDiscription> createState() => _TeamDiscriptionState();
}

class _TeamDiscriptionState extends State<TeamDiscription> {
  Widget screenView(
     // MyTeam? data
  )
  {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Team",
                style: boldStyle,
              ),
              SizedBox(
                height: 10,
              ),



              Text(
                'Team Description :',
                style: mediumStyle,
              ),

              // Team member
              Text(
                " ${"data?.team?.attributes?.body"}",
                style: labelStyle,
              ),

              //Team Needs

              // Expanded(
              //   child: Align(
              //     alignment: FractionalOffset.bottomCenter,
              //     child: Button(),
              //   ),
              // ),
              //Button
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

  // Widget Button() {
  //   return Container(
  //     height: MediaQuery.of(context).size.height / 5,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       crossAxisAlignment: CrossAxisAlignment.end,
  //       children: [
  //         TextInkWell(
  //           text: "Return",
  //           onTap: () {
  //             Navigator.pop(context);
  //           },
  //           color: AppColors.greyDark,
  //           container: false,
  //         ),
  //         TextInkWell(
  //             text: "Edit",
  //             container: false,
  //             onTap: () {
  //               navigateTo(context, EditTeam());
  //             },
  //             color: AppColors.blue),
  //         TextInkWell(
  //           text: "Remove",
  //           onTap: () {},
  //           color: AppColors.red,
  //           container: false,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TeamCubit, TeamStates>(
      listener: (context, state) {
        print(state);
        // TODO: implement listener
      },
      builder: (context, state) {
      //  var data = TeamCubit.get(context).myTeam;
        return Scaffold(
      //    body: data != null ?
          body: screenView(),
        //      : Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
