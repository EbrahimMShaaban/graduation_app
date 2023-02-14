import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app1/layout/home/cubit/team_cubit.dart';
import 'package:login_app1/shared/components/constants.dart';
import 'package:login_app1/shared/styles/colors.dart';
import 'package:login_app1/shared/styles/mu_styal.dart';

import '../../../../models/User.dart';
import '../../../../shared/components/navigator.dart';
import '../../../../shared/network/local/shared_preferences.dart';
import '../../widgets/Text_Button.dart';
import '../yourTeam/view.dart';

List<String>? list = <String>['credit', 'general'];

class AddTeam extends StatefulWidget {
  const AddTeam({Key? key}) : super(key: key);

  @override
  State<AddTeam> createState() => _AddTeamState();
}

class _AddTeamState extends State<AddTeam> {
  TextEditingController teamMembers = TextEditingController();
  TextEditingController teamNeeds = TextEditingController();
  String dropdownValue = "credit";

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
              child: Center(
                child: DropdownButton<String>(
                  value: dropdownValue,
                  elevation: 50,
                  style: const TextStyle(color: Colors.black,fontSize: 25),

                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue = value!;
                      print(value);

                    });
                    // This is called when the user selects an item.
                  },
                  items: list?.map<DropdownMenuItem<String>>((String value) {

                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
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
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Mention members, needs \n or any other information about your team ',
          style: labelStyle.apply(
            fontSizeDelta: -9,
          ),
        ),
        SizedBox(
          height: 15,
        ),
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
        print(state);
        if (state is CreateTeamSuccessState) {
          print(state);
          print("state");
          navigateAndFinished(context, YourTeamScreen());
        } else {
        }
      },
      builder: (context, state) {
        TeamCubit? teamCubit = TeamCubit.get(context);

        return Scaffold(
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextInkWell(
                              text: "Return",
                              onTap: () {
                                Navigator.pop(context);
                              },
                              color: AppColors.greyDark,
                              container: false,
                            ),

                            state is CreateTeamLoadingtState
                                ? Center(
                                    child: CircularProgressIndicator(
                                        color: primarycolor),
                                  )
                                : TextInkWell(
                                    text: "Submit",
                                    onTap: () async {
                                      teamCubit.createTeam(
                                          teamMembers: teamMembers.text,
                                          teamNeeds: teamNeeds.text,
                                          Type: dropdownValue);
                                      // if (state is CreateTeamSuccessState) {
                                      //   navigateAndFinished(
                                      //       context, YourTeamScreen());

                                    ;
                                    },
                                    color: AppColors.blue,
                                    container: true,
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
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
