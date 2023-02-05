import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_app1/layout/home/cubit/my_team_cubit.dart';
import 'package:login_app1/shared/styles/colors.dart';
import 'package:login_app1/shared/styles/mu_styal.dart';

import '../../../../shared/components/navigator.dart';
import '../../widgets/Text_Button.dart';
import '../yourTeam/view.dart';

class AddTeam extends StatefulWidget {
  const AddTeam({Key? key}) : super(key: key);

  @override
  State<AddTeam> createState() => _AddTeamState();
}

class _AddTeamState extends State<AddTeam> {
  TextEditingController teamMembers = TextEditingController();
  TextEditingController teamType = TextEditingController();
  TextEditingController teamNeeds = TextEditingController();

  Widget addMembers() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: mediumStyle,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 50,
              width: 145,
              decoration: const BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.all(
                    Radius.circular(30.0)), // set rounded corner radius
              ),
              child: TextField(
                textAlignVertical: TextAlignVertical.top,
                controller: teamMembers,
                style: TextStyle(
                    fontSize: 20,
                    height: 1.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                ),
                maxLines: 5,
                // <-- SEE HERE
                minLines: 1, //
                // <
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Type',
              style: mediumStyle,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 50,
              width: 145,
              decoration: const BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.all(
                    Radius.circular(30.0)), // set rounded corner radius
              ),
              child: TextField(
                textAlignVertical: TextAlignVertical.top,
                controller: teamType,
                style: TextStyle(
                    fontSize: 20,
                    height: 1.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                ),
                maxLines: 5,
                // <-- SEE HERE
                minLines: 1, //
                // <
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget yourNeed() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Team Description',
          style: mediumStyle,
        ),  SizedBox(height: 5,),   Text(
          'Mention members, needs \n or any other information about your team ',
          style: labelStyle.apply(fontSizeDelta: -9,),
        ), SizedBox(height: 15,),
        Container(
          height: MediaQuery.of(context).size.height / 2,
          decoration: const BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.all(
                Radius.circular(30.0)), // set rounded corner radius
          ),
          child: TextField(
            textAlignVertical: TextAlignVertical.top,
            controller: teamNeeds,
            style: TextStyle(
                fontSize: 20,
                height: 1.5,
                fontWeight: FontWeight.w500,
                color: Colors.black54),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            ),
            maxLines: 5,
            // <-- SEE HERE
            minLines: 1, //
            // <
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TeamCubit, TeamStates>(
      listener: (context, state) {
        if (state is CreateTeamSuccessState) {
          navigateAndFinished(context, YourTeamScreen());

          Fluttertoast.showToast(
              msg: "11111111111111",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        } else {
          Fluttertoast.showToast(
              msg: "0000000000000000000000",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      builder: (context, state) {
        return Scaffold(
            // bottomSheet: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     TextInkWell(
            //         text: "Return", onTap: () {}, color: returnButton),
            //     ConditionalBuilder(
            //       condition: state is! CreateTeamLoadingtState,
            //       builder: (context) => TextInkWell(
            //           text: "Submit",
            //           onTap: () {
            //             CreateTeamCubit.get(context)?.createTeam(
            //                 teamMembers: teamMembers.text,
            //                 teamNeeds: teamNeeds.text);
            //           },
            //           color: blue),
            //       fallback: (context) => const Center(
            //         child: CircularProgressIndicator(),
            //       ),
            //     ),
            //   ],
            // ),
            backgroundColor: AppColors.white,
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add a team',
                        style: boldStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      addMembers(),
                      SizedBox(
                        height: 30,
                      ),
                      yourNeed(),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: MaterialButton(
                          onPressed: () => {},
                          child:       Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextInkWell(
                                text: "Return",
                                onTap: () {},
                                color: AppColors.greyDark,
                                container: false,
                              ),

                              state is! CreateTeamLoadingtState
                                  ? TextInkWell(
                                text: "Submit",
                                onTap: () {
                                  TeamCubit.get(context)?.createTeam(
                                      teamMembers: teamMembers.text,
                                      teamNeeds: teamNeeds.text);
                                },
                                color: AppColors.blue,
                                container: true,
                              )
                                  : Center(
                                child: CircularProgressIndicator(),
                              ),
                              // ConditionalBuilder(
                              //   condition: ,
                              //   builder: (context) =>
                              //   fallback: (context) => const Center(
                              //     child: CircularProgressIndicator(),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}