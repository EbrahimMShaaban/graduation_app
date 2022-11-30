import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_app/constant/mu_styal.dart';
import 'package:graduation_app/layout/screens/add_a_team/cubit/my_team_cubit.dart';
import 'package:graduation_app/layout/screens/yourTeam/view.dart';
import 'package:graduation_app/layout/widgets/Text_Button.dart';
import '../../../constant/my_color.dart';
import '../../../constant/navigator.dart';
import '../../../data/models/CreateTeam.dart';
import '../../../data/models/CreateTeam.dart';

class AddTeam extends StatefulWidget {
  const AddTeam({Key? key}) : super(key: key);

  @override
  State<AddTeam> createState() => _AddTeamState();
}

class _AddTeamState extends State<AddTeam> {
  TextEditingController teamMembers = TextEditingController();
  TextEditingController teamNeeds = TextEditingController();

  Widget addMembers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          'Name',
          style: mediumStyle,
        ),
        Container(
          height: 50,
          width: 145,
          decoration: const BoxDecoration(
            color: grey,
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

  Widget yourNeed() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Team Description',
          style: mediumStyle,
        ),
        Container(
          height: MediaQuery.of(context).size.height / 2,
          decoration: const BoxDecoration(
            color: grey,
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
    return BlocProvider(
      create: (context) => CreateTeamCubit(),
      child: BlocConsumer<CreateTeamCubit, CreateTeamState>(
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
              backgroundColor: white,
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextInkWell(
                                text: "Return", onTap: () {}, color: greyDark, container: false,),
                            ConditionalBuilder(
                              condition: state is! CreateTeamLoadingtState,
                              builder: (context) => TextInkWell(
                                  text: "Submit",
                                  onTap: () {
                                    CreateTeamCubit.get(context)?.createTeam(
                                        teamMembers: teamMembers.text,
                                        teamNeeds: teamNeeds.text);
                                  },
                                  color: blue, container: true,),
                              fallback: (context) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
