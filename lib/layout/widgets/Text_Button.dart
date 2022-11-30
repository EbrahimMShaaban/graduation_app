import 'package:flutter/material.dart';
import 'package:graduation_app/constant/my_color.dart';

class TextInkWell extends StatelessWidget {
  final String text;
  final Color color;
  final Function onTap;
  final bool container;

  TextInkWell({required this.text, required this.onTap, required this.color, required this.container});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onTap();
        },

        child:
        container==true? Container(
          width: 109,
height: 45,
decoration: BoxDecoration(
  color: Color(0xFF2589A9),
  borderRadius: BorderRadius.circular(100)
),
      child: Center(child: Text(
        text,
        style: TextStyle(fontSize: 25, color: white),
      ),)
    ):Text(
          text,
          style: TextStyle(fontSize: 25, color: color),
        ),
    
    
    );
  }
}
