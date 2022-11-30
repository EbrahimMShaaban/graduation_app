import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/constant/app_strings.dart';
import 'package:graduation_app/data/data_resources/remote/dio.dart';

import '../../../../data/models/CreateTeam.dart';

part 'my_team_state.dart';

class MyTeamCubit extends Cubit<MyTeamState> {
  MyTeamCubit() : super(MyTeamInitial());
  MyTeam? myTeam;

  static MyTeamCubit? get(context) => BlocProvider.of(context);

  void getMyTeam (){
    emit(MyTeamLoadingtState());
    DioHelper.getData(url:myTeams ).then((value) {
      myTeam =MyTeam.fromJson(value.data);
      print("1111111111111111111111111111111111111111111111111");

      emit(MyTeamSuccessState());
    }).catchError((error){
      print(error);
      print("00000000000000000000000000000");
emit(MyTeamErrorState(message: error));
    });
  }

}
