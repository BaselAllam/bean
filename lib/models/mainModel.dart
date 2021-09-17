import 'package:bean/models/category/categorycontroller.dart';
import 'package:bean/models/chief/chiefcontroller.dart';
import 'package:bean/models/meal/mealcontroller.dart';
import 'package:bean/models/user/usercontroller.dart';
import 'package:scoped_model/scoped_model.dart';



class MainModel extends Model with CategoryController, ChiefController, MealController, UserController{}