import 'package:bean/models/controller/shared.dart';
import 'package:bean/models/mainModel.dart';
import 'package:bean/screens/bottomnavbar/bottomnavbar.dart';
import 'package:bean/theme/sharedFontStyle.dart';
import 'package:bean/widgets/field.dart';
import 'package:bean/widgets/signinAndUpButton.dart';
import 'package:bean/widgets/snack.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordKey = GlobalKey<FormState>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isSecured = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: formKey,
          child: Column(
          children: [
            field('Email Address', Icons.email, TextInputAction.done,
                TextInputType.emailAddress, false, emailController, emailKey),
            field('Password', Icons.lock, TextInputAction.done,
                TextInputType.text, isSecured, passwordController, passwordKey,
                suffixButton: IconButton(
                  icon: Icon(Icons.remove_red_eye),
                  color: Colors.grey,
                  iconSize: 20.0,
                  onPressed: () {
                    setState(() {
                      isSecured = !isSecured;
                    });
                  },
                )),
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                child: Text(
                  '\nForgot Password?!\n',
                  style: subTextStyle,
                ),
                onTap: () {},
              ),
            ),
            SingInAndUpButton('Login', () {
              if (formKey.currentState!.validate() == false) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(snack(Colors.red, 'Some Fields Required'));
              } else {
                Shared.saveToLocal('email', emailController.text);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
                  return BottomNavBar(MainModel());
                }));
              }
            })
          ],
        ),
      ),
    );
  }
}
