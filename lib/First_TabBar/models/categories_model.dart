import 'package:receitas_app/First_TabBar/models/recipes_model.dart';

class CategoriesModel {
  final String name;
  List<RecipesModel> recipes;

  CategoriesModel({required this.name, required this.recipes});
}
