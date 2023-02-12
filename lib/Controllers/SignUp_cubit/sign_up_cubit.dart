import 'package:dio/dio.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../models/User.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../../../shared/network/remote/end_points.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  static SignUpCubit get(context) => BlocProvider.of(context);
  String message = "";
  Future postSignUpDetails(
      {required context,
      required name,
      required email,
      required password,
    //  required confirmPassword
      }) async {
    Map<String, dynamic> postdata = {
      "name": name,
      "email": email,
      "password": password,
    //  "password_confirmation": confirmPassword
    };

    emit(SignUpLoadingState());

    try {
      var response = await DioHelper.postdata(
          url: SIGNUP,
          posteddata: postdata,
          headers: {"Accept": "application/json"});
      if (response.data['token'] != null) {
        User.id = response.data["user"]["id"].toString();
        User.name = response.data["user"]["name"];
        User.email = response.data["user"]["email"];
        User.token = response.data["token"];
        message = "done";

        emit(SignUpSuccessState());
      }
      print(response);
    } catch (e) {
     // DioError error = e as DioError;
      print(e);

     // message = error.response!.data["message"];
      emit(SignUpResultState());

    }
    return message;
  }
}
