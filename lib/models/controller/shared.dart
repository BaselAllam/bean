import 'package:shared_preferences/shared_preferences.dart';



class Shared{


  static void saveToLocal(String key, String value) async {

    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.setString(key, value);
  }


  static Future<String> getFromLocal(String key) async {

    String _value = '';

    try{
      SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
      _value = _sharedPreferences.getString(key)!;
    }catch(e) {
      print(e);
    }

    return _value;
  }


  static clearLocal() async {
    
    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.clear();
  }

}