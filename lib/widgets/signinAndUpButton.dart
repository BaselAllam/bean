import 'package:bean/theme/sharedFontStyle.dart';
import 'package:bean/theme/sharedcolors.dart';
import 'package:flutter/material.dart';

class SingInAndUpButton extends StatefulWidget {
  final String txt;
  final Function onPressed;

  SingInAndUpButton(this.txt, this.onPressed);

  @override
  _SingInAndUpButtonState createState() => _SingInAndUpButtonState();
}

class _SingInAndUpButtonState extends State<SingInAndUpButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        widget.txt,
        style: appBarButtonTextStyle,
      ),
      style: TextButton.styleFrom(
          backgroundColor: appBarAndButtonColor,
          fixedSize: Size(MediaQuery.of(context).size.width / 2, 45.0)),
      onPressed: () {
        widget.onPressed();
      },
    );
  }
}
