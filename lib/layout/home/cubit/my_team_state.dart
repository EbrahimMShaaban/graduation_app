part of 'my_team_cubit.dart';

@immutable
abstract class TeamStates {}

class CreateTeamInitial extends TeamStates {}

class CreateTeamInitialStates extends TeamStates{}
class CreateTeamLoadingtState extends TeamStates{}
class CreateTeamSuccessState extends TeamStates{

  // late final CreateTeamModel loginModel;
  // CreateTeamSuccessState(this.loginModel);
}
class CreateTeamErrorState extends TeamStates{
  // final String? message;
  //
  // CreateTeamErrorState({required this.message});

}

class MyTeamInitial extends TeamStates {}

class MyTeamInitialStates extends TeamStates{}
class MyTeamLoadingtState extends TeamStates{}
class MyTeamSuccessState extends TeamStates{

  // late final MyTeamModel loginModel;
  // MyTeamSuccessState(this.loginModel);
}
class MyTeamErrorState extends TeamStates{
  final String? message;

  MyTeamErrorState({required this.message});

}
