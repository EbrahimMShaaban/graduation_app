import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/constant/mu_styal.dart';
import 'package:graduation_app/constant/my_color.dart';
import 'package:graduation_app/constant/navigator.dart';
import 'package:graduation_app/layout/screens/add_a_team/view.dart';
import 'package:graduation_app/layout/screens/yourTeam/cubit/my_team_cubit.dart';
import 'package:graduation_app/layout/widgets/Text_Button.dart';

import '../../../data/models/CreateTeam.dart';

class YourTeamScreen extends StatefulWidget {
  const YourTeamScreen({Key? key}) : super(key: key);

  @override
  State<YourTeamScreen> createState() => _YourTeamScreenState();
}

class _YourTeamScreenState extends State<YourTeamScreen> {


  Widget screenView(MyTeam? data) {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
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
                " ${data?.team?.attributes?.name}",
                style: labelStyle,
              ),


              // Team member
              Text(" ${data?.team?.attributes?.body}", style: labelStyle,),

              //Team Needs



              //Button
              Button(),

            ],


          ),
        ));
  }

  Widget Button() {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height / 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [

          TextInkWell(
              text: "Return", onTap: () {}, color: greyDark, container: false,),
          TextInkWell(text: "Edit", container: false, onTap: () {
            navigateTo(context, AddTeam());
          }, color: blue),
          TextInkWell(text: "Remove", onTap: () {}, color: red, container: false,),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyTeamCubit()..getMyTeam(),
      child: BlocConsumer<MyTeamCubit, MyTeamState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {

         var data = MyTeamCubit.get(context)?.myTeam;
          return Scaffold(
            body: ConditionalBuilder(
              builder: (context) =>screenView(data),


    condition:data!=null ,
fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }
}
