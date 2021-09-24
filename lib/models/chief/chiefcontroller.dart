import 'package:bean/models/chief/chiefmodel.dart';
import 'package:bean/models/controller/shared.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


mixin ChiefController on Model{

  List<ChiefModel> _allChief = [];
  List<ChiefModel> get allChief => _allChief;

  List<ChiefModel> _allChiefFav = [];
  List<ChiefModel> get allChiefFav => _allChiefFav;

  bool _isGetChiefLoading = false;
  bool get isGetChiefLoading => _isGetChiefLoading;

  bool _isAddToFavLoading = false;
  bool get isAddToFavLoading => _isAddToFavLoading;

  bool _isRemoveFromFavLoading = false;
  bool get isRemoveFromFavLoading => _isRemoveFromFavLoading;


  void favController(ChiefModel chiefModel) {

    if(chiefModel.isFav == false){
      addToFav(chiefModel);
    }else{
      removeFav(chiefModel);
    }

    chiefModel.isFav = !chiefModel.isFav;
    notifyListeners();
  }

  addToFav(ChiefModel chief) async {

    _isAddToFavLoading = true;
    notifyListeners();

    Map<String, dynamic> _data = {
      'chiefId' : chief.chiefId
    };

    http.Response _response = await http.post(
      Uri.parse('${Shared.domain}/fav.json'),
      body: json.encode(_data)
    );

    Map<String, dynamic> _favData = json.decode(_response.body);

    chief.fav.favId = _favData['name'];

    chief.isFav = true;

    _allChiefFav.add(chief);

    _isAddToFavLoading = false;
    notifyListeners();
  }


  removeFav(ChiefModel chief) async {

    _isRemoveFromFavLoading = true;
    notifyListeners();

    http.Response _response = await http.delete(Uri.parse('${Shared.domain}/fav/${chief.fav.favId}.json'));

    chief.isFav = false;

    _allChiefFav.removeWhere((i) {
      return chief.chiefId == i.chiefId;
    });

    _isRemoveFromFavLoading = false;
    notifyListeners();
  }


  Future<void> getChief() async {

    _isGetChiefLoading = true;
    notifyListeners();

    http.Response _response = await http.get(Uri.parse('${Shared.domain}/chief.json'));

    if(_response.statusCode == 200) {
      Map<String, dynamic> _data = json.decode(_response.body);
      _data.forEach((key, value) {
        Favorite _newFav = Favorite('');
        ChiefModel _newChief = ChiefModel(key, value['chiefName'], value['chiefImg'], value['categoryId'], false, _newFav);
        _allChief.add(_newChief);
      });
    }

    _isGetChiefLoading = false;
    notifyListeners();
  }
}