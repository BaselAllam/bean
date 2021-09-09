import 'package:bean/theme/sharedFontStyle.dart';
import 'package:bean/theme/sharedcolors.dart';
import 'package:bean/widgets/cheifwidget.dart';
import 'package:bean/widgets/mealwidget.dart';
import 'package:flutter/material.dart';

import '../../demodata.dart';

class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarAndButtonColor,
        title: Text('WishList', style: appBarButtonTextStyle),
      ),
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Text(
              '  \n    WislListed Chief...',
              style: mainTextStyle,
            ),
            for (int i = 0; i < 5; i++) CheifWidget(),
            Text(
              '   WislListed Meals...',
              style: mainTextStyle,
            ),
            for (String i in mealImages) MealWidget(i)
          ],
        ),
      ),
    );
  }
}
