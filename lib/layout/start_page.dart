import 'package:flutter/material.dart';
import 'package:login_app1/layout/sign_up_page.dart';
import 'package:login_app1/shared/styles/colors.dart';
import 'package:login_app1/shared/styles/styles.dart';

import '../shared/components/components.dart';
import 'browsing_teams/browse_view.dart';
import 'sign_in_page.dart';

class StartPage extends StatelessWidget {
  StartPage({Key? key}) : super(key: key);
  double spaceBetweenButtons = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //  mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonTemplate(
                  color: Color.fromARGB(255, 61, 151, 181),
                  text1: "Sign Up",
                  text2: " as a ",
                  text3: "Team Leader",
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
                ),
                SizedBox(
                  height: spaceBetweenButtons,
                ),
                ButtonTemplate(
                  color: Color.fromARGB(255, 61, 151, 181),
                  text1: "Sign in",
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignInPage()));
                  },
                ),
                SizedBox(
                  height: spaceBetweenButtons,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 2,
                      width: 30,
                      color: Colors.grey[400],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 5.0, left: 8.0, right: 8.0),
                      child: Text(
                        "or",
                        style: TextStyle(fontSize: 20, color: Colors.grey[400]),
                      ),
                    ),
                    Container(
                      height: 2,
                      width: 30,
                      color: Colors.grey[400],
                    )
                  ],
                ),
                SizedBox(
                  height: spaceBetweenButtons,
                ),
                TextButton(

                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => BrowseView()));
                    },
                    child: RichText(
                      text: TextSpan(
                          text: 'Browse ',
                          style: AppTextStyles.boldtitles
                              .copyWith(color: AppColors.background),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'teams',
                              style: AppTextStyles.w400
                                  .copyWith(color: AppColors.background),
                            )
                          ]),
                    ))
                // ButtonTemplate(
                //   color: Color.fromARGB(255, 61, 151, 181),
                //   text1: "Sign Up",
                //   text2: " as a ",
                //   text3: "Team Leader",
                //   onPressed: () {
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (context) => SignUpPage()));
                //   },
                // ),
              ],
            ),
          ),
          BottomText(),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
