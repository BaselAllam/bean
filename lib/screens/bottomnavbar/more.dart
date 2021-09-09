import 'package:bean/theme/sharedFontStyle.dart';
import 'package:bean/theme/sharedcolors.dart';
import 'package:flutter/material.dart';

class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  List<Map<String, dynamic>> listItem = [
    {
      'txt': 'My Profile',
      'icon': Icons.account_circle,
    },
    {
      'txt': 'Setting',
      'icon': Icons.settings,
    },
    {
      'txt': 'Contact Us',
      'icon': Icons.phone,
    },
    {
      'txt': 'About Us',
      'icon': Icons.info,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarAndButtonColor,
        title: Text('More', style: appBarButtonTextStyle),
      ),
      body: Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: listItem.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(10.0),
              child: ListTile(
                leading: Icon(listItem[index]['icon'],
                    color: appBarAndButtonColor, size: 20.0),
                title: Text(
                  listItem[index]['txt'],
                  style: mainTextStyle,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                  size: 20.0,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
