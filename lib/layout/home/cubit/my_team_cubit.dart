import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';

import '../../../../../shared/network/remote/dio_helper.dart';
import '../../../../../shared/network/remote/end_points.dart';
import '../../../models/CreateTeam.dart';

part 'my_team_state.dart';

class TeamCubit extends Cubit<TeamStates> {
  TeamCubit() : super(CreateTeamInitial());

  static TeamCubit? get(context) => BlocProvider.of(context);
  MyTeam? myTeam;

  void getMyTeam() {
    emit(MyTeamLoadingtState());
    DioHelper.getdata(url: myTeams).then((value) {
      myTeam = MyTeam.fromJson(value.data);
      print("1111111111111111111111111111111111111111111111111");

      emit(MyTeamSuccessState());
    }).catchError((error) {
      print(error);
      print("00000000000000000000000000000");
      emit(MyTeamErrorState(message: error));
    });
  }

  void createTeam({
    required String? teamMembers,
    required String? teamNeeds,
  }) {
    Map<String, dynamic> postdata = {
      "name": teamMembers,
      "trpe": teamMembers,
      "body": teamNeeds,
    };

    emit(CreateTeamLoadingtState());
    DioHelper.postdata(url: teams, posteddata: postdata, headers: {
      "Accept": "application/json",
      'Authorization': '1|zmr0PmH6Xzo2Lwao74KDh2etBhoi2NG7s4MzG5Cy',
    }).then((value) {
      print("00000000000000000000000000000000000");
      emit(CreateTeamSuccessState());
    }).catchError((error) {
      print("111111111111111111111111111");
      print(teamMembers);
      print(error);
      print(error.toString());
      print(teamNeeds);
      print("111111111111111111111111111");

      emit(CreateTeamErrorState());
    });
  }
}
