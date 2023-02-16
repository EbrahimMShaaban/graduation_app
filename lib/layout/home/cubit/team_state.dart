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

class UpdataTeamLoadingtState extends TeamStates{}
class UpdataTeamSuccessState extends TeamStates{

  // late final UpdataTeamModel loginModel;
  // UpdataTeamSuccessState(this.loginModel);
}
class UpdataTeamErrorState extends TeamStates{


  UpdataTeamErrorState();

}

class MyTeamLoadingtState extends TeamStates{}
class MyTeamSuccessState extends TeamStates{

  // late final MyTeamModel loginModel;
  // MyTeamSuccessState(this.loginModel);
}
class MyTeamErrorState extends TeamStates{
  // final String? message;

  // MyTeamErrorState({required this.message});

}class AllTeamsLoadingtState extends TeamStates{


}
class AllTeamsSuccessState extends TeamStates{

  // late final AllTeamModel loginModel;
  // MyTeamSuccessState(this.loginModel);
}
class AllTeamsErrorState extends TeamStates{
  final String? message;

  AllTeamsErrorState({required this.message});

}

class DeletLoadingtState extends TeamStates{}
class DeletSuccessState extends TeamStates{

  // late final DeletModel loginModel;
  // DeletSuccessState(this.loginModel);
}
class DeletErrorState extends TeamStates{


}
