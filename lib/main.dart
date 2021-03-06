import 'package:bean/models/controller/shared.dart';
import 'package:bean/models/mainModel.dart';
import 'package:bean/screens/bottomnavbar/bottomnavbar.dart';
import 'package:bean/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
    return ScopedModel(
      model: MainModel(),
      child: ScopedModelDescendant(
        builder: (context, child, MainModel model) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: user.isEmpty ? Login() : BottomNavBar(model)
          );
        },
      ),
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


// multi language => https://resocoder.com/2019/06/01/flutter-localization-the-easy-way-internationalization-with-json/

// apk link => https://drive.google.com/file/d/1BUgnkWyHig8tPW4D6CrZsEpyEDmnq7zG/view?usp=sharing