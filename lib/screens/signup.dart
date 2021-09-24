import 'package:bean/models/controller/shared.dart';
import 'package:bean/screens/bottomnavbar/bottomnavbar.dart';
import 'package:bean/theme/sharedFontStyle.dart';
import 'package:bean/theme/sharedcolors.dart';
import 'package:bean/widgets/field.dart';
import 'package:bean/widgets/signinAndUpButton.dart';
import 'package:bean/widgets/snack.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  GlobalKey<FormState> userNameKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordKey = GlobalKey<FormState>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isSecured = true;

  bool accepted = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            field('Email Address', Icons.email, TextInputAction.done,
                TextInputType.emailAddress, false, emailController, emailKey),
            field(
                'User Name',
                Icons.account_circle,
                TextInputAction.done,
                TextInputType.emailAddress,
                false,
                userNameController,
                userNameKey),
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
            ListTile(
              title: Text(
                'Terms & Conditions',
                style: mainTextStyle,
              ),
              trailing: Checkbox(
                value: accepted,
                activeColor: appBarAndButtonColor,
                checkColor: Colors.white,
                hoverColor: appBarAndButtonColor,
                onChanged: (value) {
                  setState(() {
                    accepted = value!;
                  });
                },
              ),
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        child: ListTile(
                          title: Text(
                            'Read Our Terms & Conditions',
                            style: mainTextStyle,
                          ),
                          subtitle: Text(
                            '''A Terms and Conditions agreement is not legally required. However, having one comes with a number of important benefits for both you and your users/customers.
The benefits include increasing your control over your business/platform, while helping your users understand your rules, requirements and restrictions.''',
                            style: subTextStyle,
                          ),
                        ),
                      );
                    });
              },
            ),
            SingInAndUpButton('Signup', () {
              if (formKey.currentState!.validate() == false) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(snack(Colors.red, 'Some Fields Required'));
              }else if (accepted == false) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(snack(Colors.red, 'Kindly Accept Terms & Conditions'));
              } else {
                Shared.saveToLocal('email', emailController.text);
                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (_) {
                //   return BottomNavBar();
                // }));
              }
            })
          ],
        ),
      ),
    );
  }
}
