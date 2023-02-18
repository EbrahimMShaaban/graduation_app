import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app1/layout/home/cubit/team_cubit.dart';
import 'package:login_app1/models/model_myteam.dart';
import 'package:login_app1/shared/components/constants.dart';
import 'package:login_app1/shared/styles/colors.dart';
import 'package:login_app1/shared/styles/mu_styal.dart';

import '../../../../shared/components/navigator.dart';
import '../../widgets/Text_Button.dart';
import '../yourTeam/view.dart';

List<String>? list = <String>['credit', 'general'];

class EditTeam extends StatefulWidget {
  const EditTeam({Key? key, required this.data}) : super(key: key);
 final MyTeam data;
  @override
  State<EditTeam> createState() => _EditTeamState();
}

class _EditTeamState extends State<EditTeam> {
  TextEditingController teamMembers = TextEditingController();

  TextEditingController teamNeeds = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String dropdownValue = "credit";

  @override
  void initState() {
    String _teamMembers = widget.data.team.attributes.title;
   String _teamNeeds = widget.data.team.attributes.body;
    teamMembers = TextEditingController(text: _teamMembers);
    teamNeeds = TextEditingController(text: _teamNeeds);
    dropdownValue = widget.data.team.attributes.type;
    super.initState();
  }
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
              child: TextFormField(
                textAlignVertical: TextAlignVertical.top,
                controller: teamMembers,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please Write name ';
                  } else if (value.length < 3) {
                    return 'The name should consist of at least 3 letters.';
                  }
                  return null;
                },
                style: TextStyle(
                    fontSize: 20,
                    height: 1.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 3),
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
                  style: const TextStyle(color: Colors.black, fontSize: 25),
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue = value!;
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
          height: MediaQuery
              .of(context)
              .size
              .height / 2,
          decoration: const BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.all(
                Radius.circular(30.0)), // set rounded corner radius
          ),

          //تظبيط ال pading و الكنتينر كلة يتظبط على التيكست فورم فيلد
          child: TextFormField(

            textAlignVertical: TextAlignVertical.top,
            controller: teamNeeds,

            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Please Write description ';
              } else if (value.length < 10) {
                return 'The description should consist of at least 10 letters.';
              }
              return null;
            },
            style: TextStyle(
                fontSize: 20,
                height: 1.5,
                fontWeight: FontWeight.w500,
                color: Colors.black54),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            maxLines: 15,
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
    // TeamCubit? teamCubit = TeamCubit.get(context);

    return BlocConsumer<TeamCubit, TeamStates>(
      listener: (context, state) {
        print(state);
        print("عاااااااااااااااااااااااااااا");
        if (state is UpdataTeamSuccessState) {
          navigateAndFinished(context, YourTeamScreen());
        } else {
          
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: AppColors.white,
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (state is UpdataTeamLoadingtState)
                          LinearProgressIndicator(),
                        Text(
                          'Edit your team',
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
                                  navigateTo(context, YourTeamScreen());
                                },
                                color: AppColors.greyDark,
                                container: false,
                              ),

                              state is UpdataTeamLoadingtState
                                  ? Center(
                                child: CircularProgressIndicator(
                                    color: primarycolor),
                              )
                                  : TextInkWell(
                                text: "Submit",
                                onTap: () {
                                  if(formKey.currentState!.validate()){
                                    TeamCubit.get(context).EditTeam(
                                        teamMembers: teamMembers.text,
                                        teamNeeds: teamNeeds.text,
                                        type: dropdownValue,
                                      context: context
                                    );

                                  }
                                },
                                color: AppColors.blue,
                                container: true,
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
