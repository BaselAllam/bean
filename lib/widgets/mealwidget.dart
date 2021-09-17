import 'package:bean/theme/sharedFontStyle.dart';
import 'package:bean/theme/sharedcolors.dart';
import 'package:flutter/material.dart';

class MealWidget extends StatefulWidget {
  final String image;
  MealWidget(this.image);

  @override
  _MealWidgetState createState() => _MealWidgetState();
}

class _MealWidgetState extends State<MealWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        child: Column(children: [
          Container(
            height: 220.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              image: DecorationImage(
                  image: NetworkImage(widget.image), fit: BoxFit.fill),
            ),
            alignment: Alignment.centerRight,
            child: Container(
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: appBarAndButtonColor),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        dataContainer(Icons.watch, '20 Minute'),
                        divider(),
                        dataContainer(Icons.rate_review, '4.9'),
                        divider(),
                        dataContainer(Icons.attach_money, '200 USD'),
                      ],
                    ),
                  )
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0))),
          ),
          ListTile(
            title: Text('Checken BBQ', style: mainTextStyle),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [tags('Fast Food'), tags('Healthy Food'), tags('BBQ')],
            ),
          )
        ]));
  }

  Container dataContainer(IconData icon, String txt) {
    return Container(
      child: Column(
        children: [
          Icon(
            icon,
            size: 25.0,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '$txt',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          )
        ],
      ),
    );
  }

  Divider divider() {
    return Divider(
      color: Colors.white,
      thickness: 2.0,
      endIndent: 10.0,
      indent: 10.0,
    );
  }

  Container tags(String txt) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.5),
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Text(
        '$txt',
        style: subTextStyle,
      ),
    );
  }
}
