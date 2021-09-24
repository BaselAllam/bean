import 'package:bean/models/chief/chiefmodel.dart';
import 'package:bean/models/mainModel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class Fav extends StatefulWidget {

ChiefModel chief;

Fav(this.chief);

  @override
  _FavState createState() => _FavState();
}

class _FavState extends State<Fav> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
        return Container(
          decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: IconButton(
            icon: Icon(widget.chief.isFav == false ? Icons.favorite_border : Icons.favorite),
            color: Colors.red,
            iconSize: 20.0,
            onPressed: () {
              model.favController(widget.chief);
            },
          ),
        );
      },
    );
  }
}
