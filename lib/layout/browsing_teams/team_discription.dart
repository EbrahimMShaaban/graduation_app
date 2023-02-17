import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app1/shared/components/constants.dart';
import 'package:login_app1/shared/styles/colors.dart';

import '../../../../shared/styles/mu_styal.dart';
import '../../models/allteams_model.dart';
import '../../shared/styles/styles.dart';
import '../home/cubit/team_cubit.dart';

class TeamDiscription extends StatelessWidget {
  TeamDiscription(
      {required this.allTeams,
      //required this.teams,
      Key? key})
      : super(key: key);

  // Teams? teams;
  final Teams? allTeams;

  Widget screenView(BuildContext context
      // MyTeam? data
      ) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${allTeams?.attributes?.title}',
            maxLines: 2,
            overflow: TextOverflow.fade,
            style: boldStyle.apply(fontSizeDelta: -3,color: AppColors.background),
          ),
          SizedBox(
            height: MediaQueryHelper.sizeFromHeight(context, 20),
          ),

          SizedBox(
            height: MediaQueryHelper.sizeFromHeight(context, 20),
            child: Text(
              'Team description:',
              style: mediumStyle,
            ),
          ),
          SizedBox(
            height: 10,
          ),

          // Team member
          Text(
            '${allTeams?.attributes?.body}',
            style: labelStyle.apply(fontSizeDelta: -5),
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
                    child: Text(
                      "return",
                      style: AppTextStyles.boldtitles.apply(fontSizeDelta: 7),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }



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
          body: screenView(context),
          //      : Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
