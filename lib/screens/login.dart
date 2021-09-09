import 'package:bean/theme/sharedFontStyle.dart';
import 'package:bean/theme/sharedcolors.dart';
import 'package:flutter/material.dart';
import 'package:bean/screens/signin.dart';
import 'package:bean/screens/signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://png.pngtree.com/thumb_back/fw800/background/20190221/ourmid/pngtree-food-western-food-simple-poster-background-image_25130.jpg'),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(Colors.black45, BlendMode.color)),
        ),
        alignment: Alignment.center,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 800),
                  curve: Curves.easeInOutBack,
                  margin: EdgeInsets.only(top: 20.0),
                  height: isPressed == false
                      ? MediaQuery.of(context).size.height / 2.5
                      : MediaQuery.of(context).size.height / 3,
                  width: isPressed == false
                      ? MediaQuery.of(context).size.width / 1.5 : 
                      MediaQuery.of(context).size.width / 1.8,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://www.nicepng.com/png/full/299-2993275_food-order-icon-food-order-logo.png'),
                          fit: BoxFit.fill)),
                ),
              ],
            ),
            Column(
              children: [
                AnimatedContainer(
                  margin: EdgeInsets.all(10.0),
                  duration: Duration(milliseconds: 800),
                  curve: Curves.easeInOutBack,
                  height: isPressed == false
                      ? MediaQuery.of(context).size.height / 2
                      : MediaQuery.of(context).size.height / 1.7,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      ListTile(
                        title: Text(
                          isPressed == false ? 'Login' : 'Signup',
                          style: mainTextStyle,
                        ),
                        subtitle: Text(
                          isPressed == false
                              ? 'Don\'nt have an account ?!'
                              : 'Already have an account',
                          style: subTextStyle,
                        ),
                        trailing: TextButton(
                          child: Text(
                            isPressed == false ? 'Sign Up' : 'Login',
                            style: appBarButtonTextStyle,
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: appBarAndButtonColor,
                          ),
                          onPressed: () {
                            setState(() {
                              isPressed = !isPressed;
                            });
                          },
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        margin: EdgeInsets.all(10.0),
                        child: isPressed == false ? 
                        SignIn() : SignUp()
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
