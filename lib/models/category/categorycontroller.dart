import 'package:bean/models/category/categorymodel.dart';
import 'package:scoped_model/scoped_model.dart';




mixin CategoryController on Model{

  List<CategoryModel> _allCategories = [];
  List<CategoryModel> get allCategories => _allCategories;



}