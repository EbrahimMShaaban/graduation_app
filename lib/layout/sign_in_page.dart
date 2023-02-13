import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app1/shared/components/constants.dart';
import 'package:login_app1/shared/components/components.dart';
import 'package:login_app1/shared/components/navigator.dart';

import '../Controllers/Login_cubit/logincubit.dart';
import '../Controllers/Login_cubit/loginstates.dart';
import '../models/User.dart';
import '../shared/components/components.dart';
import '../shared/network/local/shared_preferences.dart';
import 'leader_welcome_page.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);
  double spaceBetweenButtons = 20;
  var email = TextEditingController();
  var password = TextEditingController();
  GlobalKey formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Form(
        child: Scaffold(
          appBar: AppBar(),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign In",
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: spaceBetweenButtons,
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
                    SizedBox(
                      height: spaceBetweenButtons,
                    ),
                    BlocBuilder<LoginCubit, LoginStates>(
                      buildWhen: (pervious, current) {
                        if (current is LoginResultState ||
                            current is LoginSuccessState ||
                            current is LoginLoadingState) {
                          return true;
                        } else {
                          return false;
                        }
                      },
                      builder: (context, state) {
                        LoginCubit logincubit = LoginCubit.get(context);

                        if (state is LoginLoadingState) {
                          return Center(
                              child: CircularProgressIndicator(
                            color: primarycolor,
                          ));
                        } else {
                          return ButtonTemplate(
                            color: primarycolor,
                            minwidth: 190,
                            text1: "Sign In",
                            onPressed: () async {
                              logincubit
                                  .postLogInDetails(
                                      context: context,
                                      email: email.text,
                                      password: password.text)
                                  .then((value) {
                            //    if (value == "done") {

                                navigateAndFinished(context,LeaderWelcomePage());
                                CacheHelper.saveData(
                                    key: 'token', value: User.token);
                              CacheHelper.saveData(
                                    key: 'name', value: User.name);
                              CacheHelper.saveData(
                                    key: 'team_id', value: User.team_id);


                            //       Navigator.push(
                            //           context,
                            //           MaterialPageRoute(
                            //               builder: (context) =>
                            //                   LeaderWelcomePage()));
                                // } else if (value != "done") {
                                //   showMyDialog(logincubit.message, context);
                                // }
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
