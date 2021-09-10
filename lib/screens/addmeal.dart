import 'dart:io';

import 'package:bean/theme/sharedFontStyle.dart';
import 'package:bean/theme/sharedcolors.dart';
import 'package:bean/widgets/field.dart';
import 'package:bean/widgets/signinAndUpButton.dart';
import 'package:bean/widgets/snack.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class AddMeal extends StatefulWidget {
  @override
  _AddMealState createState() => _AddMealState();
}

class _AddMealState extends State<AddMeal> {

TextEditingController mealNameController = TextEditingController();
TextEditingController mealPriceController = TextEditingController();

GlobalKey<FormState> mealNameKey = GlobalKey<FormState>();
GlobalKey<FormState> mealPriceKey = GlobalKey<FormState>();

GlobalKey<FormState> formKey = GlobalKey<FormState>();

File? pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarAndButtonColor,
        title: Text('Add meal', style: appBarButtonTextStyle),
        ),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height/4,
                    width: MediaQuery.of(context).size.width/2,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: pickedImage == null ?  DecorationImage(
                        image: AssetImage('assets/logo.jpeg'),
                        fit: BoxFit.fill
                      ) : DecorationImage(
                        image: FileImage(pickedImage!),
                        fit: BoxFit.fill
                      )
                    ),
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.add_a_photo),
                      color: Colors.black,
                      iconSize: 20.0,
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.white,
                          builder: (BuildContext context) {
                            return Container(
                              margin: EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Pick Photo',
                                      style: mainTextStyle
                                    )
                                  ),
                                  ListTile(
                                    title: Text(
                                      'Camera',
                                      style: mainTextStyle,
                                    ),
                                    trailing: Icon(Icons.camera, color: appBarAndButtonColor, size: 20.0),
                                    onTap: () {
                                      pickPhoto(ImageSource.camera);
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      'Gallery',
                                      style: mainTextStyle,
                                    ),
                                    trailing: Icon(Icons.photo_library_outlined, color: appBarAndButtonColor, size: 20.0),
                                    onTap: () {
                                      pickPhoto(ImageSource.gallery);
                                    },
                                  ),
                                ],
                              ),
                            );
                          }
                        );
                      }
                    ),
                  ),
                ],
              ),
              field('Meal Name', Icons.text_fields, TextInputAction.done, TextInputType.text, false, mealNameController, mealNameKey),
              field('Meal Price', Icons.attach_money, TextInputAction.done, TextInputType.number, false, mealPriceController, mealPriceKey),
              SingInAndUpButton(
                'Add meal', 
                () {
                  if(!formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      snack(Colors.red, 'Some Fields Required')
                    );
                  }
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
  pickPhoto(ImageSource source) async {
    ImagePicker _image = ImagePicker();
    XFile? picked = await _image.pickImage(source: source);
    setState(() {
      pickedImage = File(picked!.path);
    });
  }
}
