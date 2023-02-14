import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app1/Controllers/SignUp_cubit/sign_up_cubit.dart';
import 'package:login_app1/models/User.dart';
import 'package:login_app1/shared/components/constants.dart';
import 'package:login_app1/shared/components/navigator.dart';

import '../shared/components/components.dart';
import '../shared/network/local/shared_preferences.dart';
import 'leader_welcome_page.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  double spaceBetweenButtons = 20;
  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var confirmPassword = TextEditingController();
  GlobalKey formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Form(
        key: formkey,
        child: Scaffold(    appBar: AppBar(),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: "",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                            ),
                            children: [
                              TextSpan(
                                text: "Sign Up \n as a ",
                              ),
                              TextSpan(
                                  text: "Team Leader",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: primarycolor)),
                            ])),
                    SizedBox(
                      height: spaceBetweenButtons,
                    ),
                    TextFieldTemplate(
                      hintText: "Name",
                      controller: name,
                    ),
                    TextFieldTemplate(
                      hintText: "Email",
                      controller: email,
                    ),
                    TextFieldTemplate(
                      hintText: "Password",
                      controller: password,
                      obscureText: true,
                    ),
                    // TextFieldTemplate(
                    //   hintText: "Confirm Password",
                    //   controller: confirmPassword,
                    //   obscureText: true,
                    // ),
                    SizedBox(
                      height: spaceBetweenButtons,
                    ),
                    BlocBuilder<SignUpCubit, SignUpState>(
                      buildWhen: (pervious, current) {
                        if (current is SignUpResultState ||
                            current is SignUpSuccessState ||
                            current is SignUpLoadingState) {
                          return true;
                        } else {
                          return false;
                        }
                      },
                      builder: (context, state) {
                        SignUpCubit signUpCubit = SignUpCubit.get(context);
                        if (state is SignUpLoadingState) {
                          return Center(
                              child: CircularProgressIndicator(
                                  color: primarycolor));
                        } else {
                          return ButtonTemplate(
                            color: primarycolor,
                            minwidth: 190,
                            text1: "Sign Up",
                            onPressed: () async {
                              signUpCubit
                                  .postSignUpDetails(
                                      context: context,
                                      name: name.text,
                                      email: email.text,
                                      password: password.text,
                                    //  confirmPassword: confirmPassword.text
                              )
                                  .then((value) {
                               // if (value == "done") {

                                  navigateAndFinished(context,LeaderWelcomePage());

                                  CacheHelper.saveData(
                                      key: 'token', value: User.token);
                                  CacheHelper.saveData(
                                      key: 'name', value: User.name);
                                  CacheHelper.saveData(
                                      key: 'team_id', value: User.team_id);


                                //    Navigator.push(
                               //        context,
                               //        MaterialPageRoute(
                               //            builder: (context) =>
                               //                LeaderWelcomePage()));
                             //   }
                             //    else if (value != "done") {
                             //      showMyDialog(signUpCubit.message, context);
                             //    }
                                //todo:make catch error
                              });
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              BottomText(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
