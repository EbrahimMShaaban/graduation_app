import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app1/layout/home/view/editTeam/view.dart';
import 'package:login_app1/layout/leader_welcome_page.dart';
import 'package:login_app1/models/CreateTeam.dart';
import 'package:login_app1/models/model_myteam.dart';
import 'package:login_app1/shared/components/navigator.dart';

import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/mu_styal.dart';
import '../../cubit/team_cubit.dart';
import '../../widgets/Text_Button.dart';

class YourTeamScreen extends StatefulWidget {
  const YourTeamScreen({Key? key}) : super(key: key);

  @override
  State<YourTeamScreen> createState() => _YourTeamScreenState();
}

class _YourTeamScreenState extends State<YourTeamScreen> {
  @override
  bool _isShown = true;

  void _delete(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Remove your team Are you sure?'),
            // content: const Text('Are you sure to remove the box?'),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () {
                    // Remove the box
                    setState(() {
                      _isShown = false;
                    });

                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: const Text('Yes',style: TextStyle(color: Colors.red),)),
              TextButton(
                  onPressed: () {
                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'))
            ],
          );
        });
  }
  Widget screenView(MyTeam? data) {
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
            'Team Name :',
            style: mediumStyle,
          ),

          // name leader //////////////////////////////////////////////////
          Text(
            data!.team.attributes.title,
            style: labelStyle,
          ),
          Text(
            data.team.attributes.type,
            style: labelStyle,
          ),

          Text(
            'Team Description :',
            style: mediumStyle,
          ),

          // Team member
          Text(
            data.team.attributes.body,
            style: labelStyle,
          ),

          //Team Needs


          //Button
        ],
      ),
    ));
  }

  Widget Button() {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextInkWell(
            text: "Return",
            onTap: () {

              navigateTo(context, LeaderWelcomePage());
            },
            color: AppColors.greyDark,
            container: false,
          ),
          TextInkWell(
              text: "Edit",
              container: false,
              onTap: () {
                navigateTo(context, EditTeam());
              },
              color: AppColors.blue),
          TextInkWell(
            text: "Remove",
            onTap: _isShown == true ? () => _delete(context) : null,
            color: AppColors.red,
            container: false,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TeamCubit.get(context).getMyTeam();
    return BlocConsumer<TeamCubit, TeamStates>(
      listener: (context, state) {
        print(state);
        // TODO: implement listener
      },
      builder: (context, state) {

        return Scaffold(
          body: state is MyTeamSuccessState
          // TeamCubit.get(context).createTeamModel !=null
              ? screenView(TeamCubit.get(context).myTeam)
              : Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
