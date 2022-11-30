part of 'my_team_cubit.dart';

@immutable
abstract class CreateTeamState {}

class CreateTeamInitial extends CreateTeamState {}

class CreateTeamInitialStates extends CreateTeamState{}
class CreateTeamLoadingtState extends CreateTeamState{}
class CreateTeamSuccessState extends CreateTeamState{

  // late final CreateTeamModel loginModel;
  // CreateTeamSuccessState(this.loginModel);
}
class CreateTeamErrorState extends CreateTeamState{
  // final String? message;
  //
  // CreateTeamErrorState({required this.message});

}
