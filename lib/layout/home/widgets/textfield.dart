
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TextFieldItem extends StatefulWidget {
//   final String hintText;
//   final String labelText;
//   final bool scure;
//   final TextEditingController? controller;
//   final FormFieldValidator?validator;
final double width;
final double height;

// // final Function onChanged;
  const TextFieldItem({
    // this.validator,
    // required this.hintText,
    // required this.labelText,
    // required this.scure,
    // this.controller,
    // required this.onChanged
  required this.width, required this.height});

  @override
  _TextFieldItemState createState() => _TextFieldItemState();
}

class _TextFieldItemState extends State<TextFieldItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
    // margin: EdgeInsets.all(2),

      decoration: const BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.all(
            Radius.circular(40.0)), // set rounded corner radius
      ),
      child: const TextField(
        decoration: InputDecoration(
          // hintText: 'Label text',
          border: InputBorder.none,
        ),
      ),
    );
  }
}