import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app1/shared/components/navigator.dart';

import '../../../../models/CreateTeam.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/mu_styal.dart';
import '../../cubit/my_team_cubit.dart';
import '../../widgets/Text_Button.dart';
import '../add_a_team/view.dart';



class YourTeamScreen extends StatefulWidget {
  const YourTeamScreen({Key? key}) : super(key: key);

  @override
  State<YourTeamScreen> createState() => _YourTeamScreenState();
}

class _YourTeamScreenState extends State<YourTeamScreen> {


  Widget screenView(MyTeam? data) {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
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

              Text(
                'Team Description :',
                style: mediumStyle,
              ),

              // Team member
              Text(" ${data?.team?.attributes?.body}", style: labelStyle,),

              //Team Needs


              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: MaterialButton(
                    onPressed: () => {},
                    child: Button(),
                  ),
                ),
              ),
              //Button


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
              text: "Return", onTap: () {}, color:  AppColors.greyDark, container: false,),
          TextInkWell(text: "Edit", container: false, onTap: () {
            navigateTo(context, AddTeam());
          }, color:  AppColors.blue),
          TextInkWell(text: "Remove", onTap: () {}, color:  AppColors.red, container: false,),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<TeamCubit, TeamStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {

       var data = TeamCubit.get(context)?.myTeam;
        return Scaffold(
          body:data==null ?screenView(data):Center(child: CircularProgressIndicator()),

        );
      },
    );
  }
}
