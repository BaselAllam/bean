import 'package:bean/models/controller/shared.dart';
import 'package:bean/screens/bottomnavbar/bottomnavbar.dart';
import 'package:bean/screens/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

String user = '';

@override
void initState() {
  checkUser();
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: user.isEmpty ? Login() : BottomNavBar()
    );
  }
  checkUser() async {
    String _user = '';
    _user = await Shared.getFromLocal('email');
    setState(() {
      user = _user;
    });
  }
}