import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app1/models/User.dart';
import 'package:login_app1/models/allteams_model.dart';

import 'package:meta/meta.dart';

import '../../../../../shared/network/remote/dio_helper.dart';
import '../../../../../shared/network/remote/end_points.dart';
import '../../../models/CreateTeam.dart';
import '../../../models/model_myteam.dart';

part 'team_state.dart';

class TeamCubit extends Cubit<TeamStates> {
  TeamCubit() : super(TeamInitialState());

  static TeamCubit get(context) => BlocProvider.of(context);

//   List<String> list = <String>['One', 'Two', 'Three', 'Four'];
//   //String dropdownValue = TeamCubit().list.first;
// typeChange(String v) {
//
//  // dropdownValue =v;
//   emit(typeChangeState());
// }

  MyTeam? myTeam;
  AllTeams? allTeamsmodel;

  void getMyTeam() {
    print("111111111111111111111111111111111111111111dddddddd1111111");

    emit(MyTeamLoadingtState());
    DioHelper.getdata(
      url: myTeams,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    ).then((value) {
      myTeam = MyTeam.fromJson(value.data);
      print("111111111111111111111111111111111111111111dddddddd1111111");
      print(myTeam!.team?.attributes?.body);

      emit(MyTeamSuccessState());
    }).catchError((error) {
      print(error);
      print(myTeam!.team?.attributes?.title);

      print("00000000000000000000000000000");
      emit(MyTeamErrorState(message: error));
    });
  }
  void getAllTeams() {
    print("111111111111111111111111111111111111111111dddddddd1111111");

    emit(AllTeamsLoadingtState());
    DioHelper.getdata(
      url: allTeams,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },

    ).then((value) {
      allTeamsmodel = AllTeams.fromJson(value.data);
      print("111111111111111111111111111111111111111111dddddddd1111111");
    //  print(allTeamsmodel!.team?.attributes?.body);

      emit(AllTeamsSuccessState());
    }).catchError((error) {
      print(error);
      print(allTeamsmodel!.teams?[1].attributes?.type);

      print("00000000000000000000000000000");
      emit(AllTeamsErrorState(message: error));
    });
  }

  CreateTeamModel? createTeamModel;
  void createTeam({
    required String teamMembers,
    required String Type,
    required String teamNeeds,
  }) async {
    print(teamMembers);
    print(teamNeeds);
    print(Type);
    print("data 00000000000000000000000");
    emit(CreateTeamLoadingtState());
    await DioHelper.postdata(
      url: teams,
      posteddata: {
        "title": teamMembers,
        "body": teamNeeds,
        "type": Type,
      },
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
       // / 'Authorization': "Bearer 44|RMR6mXbmJI3zOm7NxqTwxW0oDoQhvA5NZkNno1pN",
      },
    ).then((value) {
      emit(CreateTeamSuccessState());
    }).catchError((error) {
      print(User.token);
      print(error.toString());

      emit(CreateTeamErrorState(message: error));
    });
  }
}
