import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app1/layout/browsing_teams/team_discription.dart';
import 'package:login_app1/layout/home/cubit/team_cubit.dart';
import 'package:login_app1/models/allteams_model.dart';
import 'package:login_app1/shared/components/components.dart';
import 'package:login_app1/shared/components/constants.dart';
import 'package:login_app1/shared/components/navigator.dart';
import 'package:login_app1/shared/styles/styles.dart';

class TeamView extends StatelessWidget {
  TeamView({required this.type, Key? key}) : super(key: key);
  bool type;

  @override
  Widget build(BuildContext context) {
    TeamCubit.get(context).getAllTeams(type: type);
    return BlocConsumer<TeamCubit, TeamStates>(
        builder: (context, state) {
          AllTeams? teamCubit = TeamCubit.get(context).allTeamsmodel;

          return Scaffold(
              body: state is AllTeamsSuccessState
                  // TeamCubit.get(context).allTeamsmodel != null
                  ? SafeArea(
                      child: Container(
                          //color: Colors.greenAccent,
                          height: MediaQuery.of(context).size.height,
                          child: Column(children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20, bottom: 20),
                              child: Text(
                                type ? "General" : 'Credit',
                                style: AppTextStyles.boldtitles
                                    .apply(fontSizeDelta: 7),
                              ),
                            ),
                            Container(
                              // color: Colors.black,
                              width:
                                  MediaQueryHelper.sizeFromWidth(context, 1.5),
                              height:
                                  MediaQueryHelper.sizeFromHeight(context, 1.1),
                              child: ListView.builder(
                                  // itemCount: teamCubit?.teams?.length,
                                  itemCount: teamCubit?.teams?.length,
                                  itemBuilder: (context, index) {
                                    print(teamCubit?.teams?.length);
                                    print(
                                        "teeeeeeeeeems is${teamCubit?.teams}");
                                    return TeamsName(
                                        name:
                                            "${teamCubit?.teams?[index].attributes!.title}",
                                        onPressed: () {
                                         navigateTo(context, TeamDiscription(
                                           allTeams: teamCubit
                                               ?.teams?[index],
                                           // teams:
                                           //     teamCubit?.teams!?[index],
                                         ));
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
                                              child: Text(
                                                "return",
                                                style: AppTextStyles.boldtitles
                                                    .apply(fontSizeDelta: 5),
                                              ),
                                            )))))
                          ])),
                    )
//                   ? SafeArea(
//
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                           //color: Colors.greenAccent,
//                           height: MediaQuery.of(context).size.height,
//                           child: Column(
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(top: 20, bottom: 20),
//                                 child: Text(
//                                   "General",
//                                   style: AppTextStyles.boldtitles,
// >>>>>>> c6fbd013df77338fb22cd465745ab64e462432ff
//                                 ),
//                               ),
//                               Container(
//                                 // color: Colors.black,
//                                 width: MediaQueryHelper.sizeFromWidth(context, 1.5),
//                                 height:
//                                     MediaQueryHelper.sizeFromHeight(context, 1.1),
//                                 child: ListView.builder(
//                                     // itemCount: teamCubit?.teams?.length,
//                                     itemCount: teamCubit?.teams?.length,
//                                     itemBuilder: (context, index) {
//                                       print(teamCubit?.teams?.length);
//                                       print("teeeeeeeeeems is${teamCubit?.teams}");
//                                       return TeamsName(
//                                           name:
//                                               "${teamCubit?.teams?[index].attributes!.title}",
//                                           onPressed: () {
//                                             Navigator.of(context).pushReplacement(
//                                                 MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         TeamDiscription(
//                                                           allTeams: teamCubit
//                                                               ?.teams?[index],
//                                                           // teams:
//                                                           //     teamCubit?.teams!?[index],
//                                                         )));
//                                           });
//                                     }),
//                               ),
//                               Expanded(
//                                 child: SizedBox(
//                                   height: 50,
//                                   child: Center(
//                                     child: Align(
//                                       alignment: Alignment.bottomCenter,
//                                       child: TextButton(
//                                         onPressed: () {
//                                           Navigator.pop(context);
//                                         },
//                                         child: Text("return"),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                     ),
//                   )
                  : Center(
                      child: CircularProgressIndicator(),
                    ));
        },
        listener: (context, state) {});
  }
}
