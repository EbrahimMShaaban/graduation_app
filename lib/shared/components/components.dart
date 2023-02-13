import 'package:flutter/material.dart';
import 'package:login_app1/models/allteams_model.dart';
import 'package:login_app1/shared/components/constants.dart';
import 'package:login_app1/shared/styles/styles.dart';

class ButtonTemplate extends StatelessWidget {
  ButtonTemplate({
    Key? key,
    required this.color,
    required this.text1,
    required this.onPressed,
    this.text2 = "",
    this.text3 = "",
    this.minwidth = 250,
    this.fontSize = 18,
  }) : super(key: key);
  Color color;
  String text1;
  String text2;
  String text3;
  double minwidth;
  double fontSize;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: minwidth,
      height: 50,
      onPressed: onPressed,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: RichText(
          text: TextSpan(
              text: "",
              style: TextStyle(color: Colors.white, fontSize: fontSize),
              children: [
            TextSpan(
                text: text1, style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: text2),
            TextSpan(
                text: text3, style: TextStyle(fontWeight: FontWeight.bold)),
          ])),
    );
  }
}

class TextFieldTemplate extends StatelessWidget {
  TextFieldTemplate(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.obscureText = false,
        this.validator,
      })
      : super(key: key);

  String hintText;
  TextEditingController controller;
  bool obscureText;
  Function? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 5),
      child: Material(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(50),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            obscureText: obscureText,
            controller: controller,
            validator: (value) => validator!(value),
            decoration:
                InputDecoration(hintText: hintText, border: InputBorder.none),
          ),
        ),
      ),
    );
  }
}

class BottomText extends StatelessWidget {
  const BottomText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: "",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
            children: [
              TextSpan(
                  text: "FCIS - ",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: "Facult of comuters \n and informatoin science"),
            ]));
  }
}

void showMyDialog(String _message, BuildContext context) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //  backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: EdgeInsets.zero,
          title: Text("Error"),
          content: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(_message),
          ),
          actions: [
            Center(
              child: TextButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ))),
                  onPressed: () {
                    Navigator.pop(context, "ok");
                  },
                  child: const Text(
                    "ok",
                    style: TextStyle(color: primarycolor, fontSize: 22),
                  )),
            )
          ],
        );
      });
}

///

class NavigateToOption extends StatelessWidget {
  NavigateToOption({Key? key, required this.name, required this.onPressed})
      : super(key: key);
  String name;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 70,
        width: 320,
        child: Material(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: [
                Text(name,
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                Spacer(),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: MaterialButton(
                      padding: EdgeInsets.zero,
                      color: primarycolor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      onPressed: onPressed),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TeamsName extends StatelessWidget {
  TeamsName({Key? key, required this.name, required this.onPressed})
      : super(key: key);
  String name;

  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
      //  color: Colors.red,

        height: 100,
        width: 1,
        child: MaterialButton(
            padding: EdgeInsets.zero,
            color: Colors.grey[100],
            shape: RoundedRectangleBorder(

                borderRadius: BorderRadius.circular(20)),

            child:  RichText(
              text: TextSpan(
                text: 'Team ',
                style: AppTextStyles.w300.apply(color: Colors.black,),

                children:  <TextSpan>[
                  TextSpan(text:  name, style: AppTextStyles.lrTitles),

                ],
              ),
            ),
            onPressed: onPressed),
      ),
    );
  }
}
