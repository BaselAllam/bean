import 'package:bean/models/category/categorymodel.dart';
import 'package:bean/models/chief/chiefmodel.dart';
import 'package:bean/models/controller/shared.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



mixin CategoryController on Model{

  List<CategoryModel> _allCategories = [];
  List<CategoryModel> get allCategories => _allCategories;

  bool _isGetCategoryLoading = false;
  bool get isGetCategoryLoading => _isGetCategoryLoading;


  Future<void> getCategoires(List<ChiefModel> chiefs) async {

    _isGetCategoryLoading = true;
    notifyListeners();

    http.Response _response = await http.get(Uri.parse('${Shared.domain}/categories.json'));

    if(_response.statusCode == 200) {

      Map<String, dynamic> _data = json.decode(_response.body);
      _data.forEach((key, value) {
        List<ChiefModel> _chief = filterChief(key, chiefs);
        CategoryModel _newCategory = CategoryModel(key, value['categoryName'], value['categoryImage'], _chief);
        _allCategories.add(_newCategory);
      });
    }

    _isGetCategoryLoading = false;
    notifyListeners();
  }

  List<ChiefModel> filterChief(String categoryId, List<ChiefModel> chiefs) {

    List<ChiefModel> _chiefs = [];

    for(ChiefModel chief in chiefs) {
      if(chief.categoryId == categoryId) {
        _chiefs.add(chief);
      }
    }
    return chiefs;
  }

  CategoryModel? selectedCategory;

  void selectCategory(CategoryModel categoryModel) {
    selectedCategory = categoryModel;
    notifyListeners();
  }

}