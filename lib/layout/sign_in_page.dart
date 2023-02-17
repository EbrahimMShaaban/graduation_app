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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Form(
         key: formKey,
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
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please Write Email';
                        } else if (value.length < 5) {
                          return 'Please write the email correctly';
                        } else if (!value.toString().contains('@')) {
                          return ' Email should contain \'@';
                        }
                        return null;
                      },
                    ),
                    TextFieldTemplate(
                      hintText: "Password",
                      controller: password,
                      obscureText: true,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please Write password';
                        }else if (value.length<6){
                          return 'password must more than 6 charcters';
                        }
                        return null;
                      },
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
                              if(formKey.currentState!.validate()){
                                logincubit
                                    .postLogInDetails(
                                    context: context,
                                    email: email.text,
                                    password: password.text)
                                    .then((value) {
                                  //    if (value == "done") {
                                  CacheHelper.saveData(
                                      key: 'token', value: User.token);
                                  CacheHelper.saveData(
                                      key: 'name', value: User.name);
                                  CacheHelper.saveData(
                                      key: 'team_id', value: User.team_id);

                                  navigateAndFinished(
                                      context, LeaderWelcomePage());


                                });
                              }
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
          //    BottomText(),
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
