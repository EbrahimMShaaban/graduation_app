part of 'team_cubit.dart';

@immutable
abstract class TeamStates {}


class typeChangeState extends TeamStates{}
class TeamInitialState extends TeamStates{}
class CreateTeamLoadingtState extends TeamStates{}
class CreateTeamSuccessState extends TeamStates{

  // late final CreateTeamModel loginModel;
  // CreateTeamSuccessState(this.loginModel);
}
class CreateTeamErrorState extends TeamStates{
  final String message;

  CreateTeamErrorState({required this.message});

}

class MyTeamLoadingtState extends TeamStates{}
class MyTeamSuccessState extends TeamStates{

  // late final MyTeamModel loginModel;
  // MyTeamSuccessState(this.loginModel);
}
class MyTeamErrorState extends TeamStates{
  final String? message;

  MyTeamErrorState({required this.message});

}
