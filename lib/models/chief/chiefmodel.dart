

class ChiefModel{

  String chiefId;
  String chiefName;
  String chiefImg;
  String categoryId;
  bool isFav;
  Favorite fav;

  ChiefModel(this.chiefId, this.chiefName, this.chiefImg, this.categoryId, this.isFav, this.fav);
}


class Favorite{

  String favId;

  Favorite(this.favId);
}


// add favorite as a field inside chief model and reasign its value and make its as defualt empty string 