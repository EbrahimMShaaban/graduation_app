part of 'my_team_cubit.dart';

@immutable
abstract class MyTeamState {}

class MyTeamInitial extends MyTeamState {}

class MyTeamInitialStates extends MyTeamState{}
class MyTeamLoadingtState extends MyTeamState{}
class MyTeamSuccessState extends MyTeamState{

  // late final MyTeamModel loginModel;
  // MyTeamSuccessState(this.loginModel);
}
class MyTeamErrorState extends MyTeamState{
  final String? message;

  MyTeamErrorState({required this.message});

}
