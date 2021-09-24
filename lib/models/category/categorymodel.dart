


import 'package:bean/models/chief/chiefmodel.dart';

class CategoryModel{

  String id;
  String name;
  String img;
  List<ChiefModel> chief = [];

  CategoryModel(this.id, this.name, this.img, this.chief);
}