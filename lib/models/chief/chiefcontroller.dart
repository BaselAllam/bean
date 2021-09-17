import 'package:bean/models/chief/chiefmodel.dart';
import 'package:scoped_model/scoped_model.dart';



mixin ChiefController on Model{


  List<ChiefModel> _allChief = [];
  List<ChiefModel> get allChief => _allChief;


  void favController(ChiefModel chiefModel) {

    chiefModel.isFav = !chiefModel.isFav;
    notifyListeners();
  }
}