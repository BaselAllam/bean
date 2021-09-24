import 'package:bean/models/mainModel.dart';
import 'package:bean/theme/sharedFontStyle.dart';
import 'package:bean/theme/sharedcolors.dart';
import 'package:bean/widgets/cheifwidget.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

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
        child: ScopedModelDescendant(
          builder: (context, child, MainModel model) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: model.allChiefFav.length,
              itemBuilder: (context, index) {
                if(model.allChiefFav.isEmpty) {
                  return Center(child: Text('No Wishlisted Chief', style: mainTextStyle,));
                }else{
                  return CheifWidget(model.allChiefFav[index]);
                }
              },
            );
          },
        ),
      ),
    );
  }
}
