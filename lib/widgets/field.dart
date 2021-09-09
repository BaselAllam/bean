import 'package:bean/theme/sharedFontStyle.dart';
import 'package:flutter/material.dart';

Container field(String label, IconData prefixIcon, TextInputAction action,
    TextInputType type, bool obsecure, TextEditingController fieldController, Key key,
    {Widget? suffixButton}) {
  return Container(
    margin: EdgeInsets.all(5.0),
    child: TextFormField(
      key: key,
      validator: (value) {
        if (value!.isEmpty) {
          return 'This field required';
        }
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.grey, width: 1.5)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.grey, width: 1.5)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.grey, width: 1.5)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.red, width: 0.5)),
          labelText: '$label',
          labelStyle: subTextStyle,
          prefixIcon: Icon(prefixIcon, color: Colors.grey, size: 20.0),
          suffixIcon: suffixButton),
      textInputAction: action,
      keyboardType: type,
      obscureText: obsecure,
      controller: fieldController,
    ),
  );
}
