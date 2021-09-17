import 'package:flutter/material.dart';

class Fav extends StatefulWidget {
  @override
  _FavState createState() => _FavState();
}

class _FavState extends State<Fav> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: IconButton(
        icon: Icon(pressed == false ? Icons.favorite_border : Icons.favorite),
        color: Colors.red,
        iconSize: 20.0,
        onPressed: () {
          pressed = !pressed;
          setState(() {});
        },
      ),
    );
  }
}
