import 'package:flutter/material.dart';


SnackBar snack(Color color, String msg) {
  return SnackBar(
    backgroundColor: color,
    content: Text('$msg'),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))
    ),
  );
}