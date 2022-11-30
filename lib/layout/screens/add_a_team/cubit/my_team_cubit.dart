import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_app/constant/app_strings.dart';
import 'package:graduation_app/data/data_resources/remote/dio.dart';
import 'package:meta/meta.dart';

part 'my_team_state.dart';

class CreateTeamCubit extends Cubit<CreateTeamState> {
  CreateTeamCubit() : super(CreateTeamInitial());

  static CreateTeamCubit? get(context) => BlocProvider.of(context);

  void createTeam({
    required String? teamMembers,
    required String? teamNeeds,
  }) {
    emit(CreateTeamLoadingtState());
    DioHelper.postData(
            url: teams,
            data: {
              "name": teamMembers,
              "body": teamNeeds,
            },
           )
        .then((value) {
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
