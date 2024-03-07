// ignore_for_file: prefer_final_fields, avoid_print

import 'package:get/get.dart';
import 'package:receitas_app/First_TabBar/models/categories_model.dart';
import 'package:receitas_app/First_TabBar/models/recipes_model.dart';

class CategoriesController extends GetxController {
  List<CategoriesModel> _categoriesList = <CategoriesModel>[].obs;

  RxMap<int, CategoriesModel> _recipesList = <int, CategoriesModel>{}.obs;

  RxBool isTextFieldNull = false.obs;

  RxInt indexRecipe = 0.obs;

  List<CategoriesModel> get categoriesList => _categoriesList;

  RxMap<int, CategoriesModel> get recipesList => _recipesList;

  void addItem({required String name, required List<RecipesModel> recipes}) {
    _categoriesList.add(CategoriesModel(name: name, recipes: recipes));
  }

  void addRecipeToCategory(int categoryIndex, RecipesModel recipe) {
    final category = _categoriesList[categoryIndex];
    category.recipes.add(recipe);
    _recipesList[categoryIndex] =
        category;
    _recipesList.refresh();
    print(categoryIndex);
    print(_recipesList.runtimeType);
    print(_recipesList[categoryIndex].runtimeType);
    print(_recipesList[categoryIndex]?.recipes.runtimeType);
  }
}
