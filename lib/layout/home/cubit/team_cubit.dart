import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app1/models/User.dart';

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

  void getMyTeam() {

    emit(MyTeamLoadingtState());
    DioHelper.getdata(
      url: myTeams+"1",
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    ).then((value) {
      myTeam = MyTeam.fromJson(value.data);
      // print("111111111111111111111111111111111111111111dddddddd1111111");
      // print(myTeam!.team.attributes.body);
      // print(myTeam!.team.id);

      emit(MyTeamSuccessState());
    }).catchError((error) {
      print(error);
      // print(myTeam!.team.attributes.title);
      // print("00000000000000000000000ddddddddddddddddddddddd000000");
      emit(MyTeamErrorState(message: error));
    });
  }
  void DeletMyTeam() {

    print(myTeams+myTeam!.team.id);
    emit(DeletLoadingtState());
    DioHelper.deletedata(
      url: myTeams+myTeam!.team.id, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization': "Bearer 54|Qlh6XJgwyks9YxRz76vD4wYw6KCoB4x4NhSVi21Z",
    },
    ).then((value) {

      emit(DeletSuccessState());
    }).catchError((error) {
      print(error);
      emit(DeletErrorState());
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
     'Authorization': "Bearer 64|UCNWcKCO7ARYZmGsM3VWAy0FzWbcN98XXCaE3fl4",
      },
    ).then((value) {
      createTeamModel= CreateTeamModel.fromJson(value.data);
      print(createTeamModel?.team.id);
      print(createTeamModel?.team.id);
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
    emit(CreateTeamLoadingtState());
    await DioHelper.postdata(
      url: myTeams+'19',
      posteddata: {
        "title": teamMembers,
        "body": teamNeeds,
        "type": Type,
      },
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
     'Authorization': "Bearer 64|UCNWcKCO7ARYZmGsM3VWAy0FzWbcN98XXCaE3fl4",
      },
    ).then((value) {
      createTeamModel= CreateTeamModel.fromJson(value.data);
      emit(CreateTeamSuccessState());

    }).catchError((error) {
      print(User.token);
      print(error.toString());

      emit(CreateTeamErrorState(message: error));
    });
  }


}
