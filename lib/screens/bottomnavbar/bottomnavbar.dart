import 'package:bean/models/mainModel.dart';
import 'package:bean/screens/bottomnavbar/homepage.dart';
import 'package:bean/screens/bottomnavbar/orders.dart';
import 'package:bean/screens/bottomnavbar/more.dart';
import 'package:bean/screens/bottomnavbar/wishlist.dart';
import 'package:bean/theme/sharedFontStyle.dart';
import 'package:bean/theme/sharedcolors.dart';
import 'package:flutter/material.dart';


class BottomNavBar extends StatefulWidget {

final MainModel model;

BottomNavBar(this.model);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

@override
void initState() {
  widget.model.getChief();
  widget.model.getCategoires(widget.model.allChief);
  widget.model.getCurrentPosition();
  super.initState();
}

  int current = 0;
  List<Widget> screens = [HomePage(), WishList(), Orders(), More()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'WishList'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
        selectedIconTheme:
            IconThemeData(color: appBarAndButtonColor, size: 20.0),
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        selectedItemColor: appBarAndButtonColor,
        unselectedItemColor: subFontColor,
        selectedLabelStyle: appBarButtonTextStyle,
        unselectedLabelStyle: subTextStyle,
        type: BottomNavigationBarType.shifting,
        currentIndex: current,
        onTap: (index) {
          setState(() {
            current = index;
          });
        },
      ),
      body: screens[current],
    );
  }
}
