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
  CreateTeamModel? createTeamModel;
  void getMyTeam() {
    emit(MyTeamLoadingtState());
    DioHelper.getdata(
      url: myTeams+User.team_id,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    ).then((value) {
      myTeam = MyTeam.fromJson(value.data);
     print("111111111111111111111111111111111111111111dddddddd1111111");
      // print(myTeam!.team.attributes.body);
      // print(myTeam!.team.id);

      emit(MyTeamSuccessState());
    }).catchError((error) {
      print(error);
     print("00000000000000000000000ddddddddddddddddddddddd000000");
      emit(MyTeamErrorState());
    });
  }

  void DeletMyTeam() {

    print(myTeams+myTeam!.team.id);
    emit(DeletLoadingtState());
    DioHelper.deletedata(
      url: myTeams+User.team_id,
      headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    'Authorization': "Bearer ${User.token}",
    },
    ).then((value) {

      emit(DeletSuccessState());
    }).catchError((error) {
      print(error);
      emit(DeletErrorState());
    });
  }



  void getAllTeams({required bool type}) {

    emit(AllTeamsLoadingtState());
    DioHelper.getdata(
      url: type?allgeneralTeams:allcreditTeams,
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


  void createTeam({
    required String teamMembers,
    required String Type,
    required String teamNeeds,
  }) async {
    print(teamMembers);
    print(teamNeeds);
    print(Type);
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
        'Authorization': "Bearer ${User.token}",
      },
    ).then((value) {
      createTeamModel= CreateTeamModel.fromJson(value.data);
      print(createTeamModel?.team.id);
      print(createTeamModel?.team.id);
      User.team_id=value.data["team"]["id"].toString();
      emit(CreateTeamSuccessState());
    }).catchError((error) {
      print(User.token);
      print(error.toString());

      emit(CreateTeamErrorState(message: error));
    });
  }


  void EditTeam({
    required String teamMembers,
    required String Type,
    required String teamNeeds,
  }) async {
    print(teamMembers);
    print(teamNeeds);
    print(Type);
    emit(UpdataTeamLoadingtState());
    await DioHelper.postdata(
      url: myTeams+User.team_id,
      posteddata: {
        "title": teamMembers,
        "body": teamNeeds,
        "type": "credit",
      },
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${User.token}",
      },
    ).then((value) {

      emit(UpdataTeamSuccessState());
      myTeam= MyTeam.fromJson(value.data);
    }).catchError((error) {
      print(User.token);
      print(error.toString());

      emit(UpdataTeamErrorState());
    });
  }


}
