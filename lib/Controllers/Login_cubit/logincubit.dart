import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app1/models/User.dart';
import 'package:motion_toast/motion_toast.dart';
import '../../shared/network/remote/dio_helper.dart';
import '../../shared/network/remote/end_points.dart';
import 'loginstates.dart';
import 'package:flutter/material.dart';
class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitalState());

  static LoginCubit get(context) => BlocProvider.of(context);
  String message = "";

  Future postLogInDetails(
      {required context, required email, required password}) async {
    Map<String, dynamic> postdata = {"email": email, "password": password};

    emit(LoginLoadingState());

    try {
      var response = await DioHelper.postdata(
          url: LOGIN,
          posteddata: postdata,
          headers: {"Accept": "application/json"});
      print(response.data);
      if (response.data['token'] != null) {
        User.id = response.data["user"]["id"].toString();
        User.team_id = response.data["user"]["team_id"].toString();
        User.name = response.data["user"]["attributes"]["name"];
        team_id = response.data["user"]["team_id"].toString();
        myName = response.data["user"]["attributes"]["name"];
        token = response.data["token"];

        User.email = response.data["user"]["attributes"]["email"];
        User.token = response.data["token"];
        message = "done";
        emit(LoginSuccessState());
      }
      print(response);
    } catch (e) {
      DioError error = e as DioError;
      // print(error.response);
      MotionToast.error(
        description:  Text(error.response!.data["message"].toString()),
      ).show(context);

      print(e);
    //  message = error.response!.data["message"];
      emit(LoginResultState());
    }
    return message;
  }

  Future postLogOutDetails() async {
    try {
      var response = await DioHelper.postdata(url: LOGOUT, headers: {
        "Authorization": "Bearer " + User.token,
        "Accept": "application/json"
      });
      print(response.data);
    } catch (e) {
      print(e);
    }
  }
}
