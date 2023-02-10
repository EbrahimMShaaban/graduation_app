import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app1/models/User.dart';

import 'package:meta/meta.dart';

import '../../../../../shared/network/remote/dio_helper.dart';
import '../../../../../shared/network/remote/end_points.dart';
import '../../../models/model_myteam.dart';

part 'team_state.dart';

class TeamCubit extends Cubit<TeamStates> {
  TeamCubit() : super(TeamInitialState());

  static TeamCubit get(context) => BlocProvider.of(context);

  // CreateTeamModel? createTeamModel;
  MyTeam? myTeam;

  void getMyTeam() {
    print("111111111111111111111111111111111111111111dddddddd1111111");

    emit(MyTeamLoadingtState());
    DioHelper.getdata(url: myTeams,      headers: {
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

  void createTeam({

    required String teamMembers,
    required String Type,
    required String teamNeeds,
  }) async{

    emit(CreateTeamLoadingtState());
    await DioHelper.postdata(
      url: teams,
      posteddata:{
        "title": teamMembers,
        "body": teamNeeds,
        "type": Type,
      },
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer 38|6u3CnJpAMNw0cUGUXTjQ71t1goTWr2PKRy6iGOnz",
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
