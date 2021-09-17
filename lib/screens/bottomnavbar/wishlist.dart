import 'package:bean/theme/sharedFontStyle.dart';
import 'package:bean/theme/sharedcolors.dart';
import 'package:flutter/material.dart';

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
        // child: ListView.builder(
        //   scrollDirection: Axis.vertical,
        //   itemCount: favChief.length,
        //   itemBuilder: (context, index) {
        //     if(favChief.isEmpty) {
        //       return Center(child: Text('No Wishlisted Chief', style: mainTextStyle,));
        //     }else{
        //       return CheifWidget();
        //     }
        //   },
        // ),
      ),
    );
  }
}
