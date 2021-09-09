import 'package:bean/theme/sharedFontStyle.dart';
import 'package:bean/widgets/fav.dart';
import 'package:flutter/material.dart';

class CheifWidget extends StatefulWidget {
  @override
  _ChifWidgetState createState() => _ChifWidgetState();
}

class _ChifWidgetState extends State<CheifWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        child: ListTile(
          leading: Container(
            height: 250.0,
            width: 100.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image:
                    DecorationImage(image: NetworkImage('https://avatars.githubusercontent.com/u/44323531?v=4'), fit: BoxFit.fill)),
          ),
          title: Text(
            'Cheif Bassel',
            style: mainTextStyle,
          ),
          subtitle: Text(
            '(25) Review - 5.5 Star\n20 km Away',
            style: subTextStyle,
          ),
          trailing: Fav(),
        ));
  }
}
