import 'package:bean/models/category/categorymodel.dart';
import 'package:bean/models/mainModel.dart';
import 'package:bean/theme/sharedFontStyle.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';



class CategoryWidget extends StatefulWidget {

final CategoryModel categoryModel;

CategoryWidget(this.categoryModel);

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
        return InkWell(
          onTap: () {
            model.selectCategory(widget.categoryModel);
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                CircleAvatar(
                  minRadius: 35.0,
                  maxRadius: 35.0,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage('${widget.categoryModel.img}'),
                ),
                Text(
                  '${widget.categoryModel.name}',
                  style: mainTextStyle,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}