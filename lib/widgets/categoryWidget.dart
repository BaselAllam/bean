import 'package:bean/theme/sharedFontStyle.dart';
import 'package:flutter/material.dart';



class CategoryWidget extends StatefulWidget {
  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          CircleAvatar(
            minRadius: 35.0,
            maxRadius: 35.0,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage('https://images.unsplash.com/photo-1551024506-0bccd828d307?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),
          ),
          Text(
            'Dessert',
            style: mainTextStyle,
          )
        ],
      ),
    );
  }
}