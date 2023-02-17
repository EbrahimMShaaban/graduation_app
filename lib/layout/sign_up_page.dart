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

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Future<void> _register(BuildContext context) async {
  //   if (!formkey.currentState!.validate()) {
  //     Navigator.pop(context);
  //     return;
  //   } else {
  //     Navigator.pop(context);
  //     formkey.currentState!.save();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
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
                      height: spaceBetweenButtons*2,
                    ),
                    TextFieldTemplate(
                      hintText: "Name",
                      controller: name,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please Write name ';
                        } else if (value.length<3) {
                          return 'The name should consist of at least 3 letters.';
                        }
                        return null;
                      },
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
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please Write password';
                        }else if (value.length<6){
                          return 'password must more than 6 charcters';
                        }
                        return null;
                      },
                      obscureText: true,
                    ),

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
                              if (formKey.currentState!.validate()) {
                                signUpCubit
                                    .postSignUpDetails(
                                  context: context,
                                  name: name.text,
                                  email: email.text,
                                  password: password.text,
                                  //  confirmPassword: confirmPassword.text
                                )
                                    .then((value) {

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
                    SizedBox(
                      height: spaceBetweenButtons*2,
                    ),
                  ],
                ),
              ),
              // BottomText(),
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
