import 'package:get/get.dart';
import 'package:receitas_app/tab_bar_food/models/categories_model.dart';
import 'package:receitas_app/tab_bar_food/models/type_of_categories_model.dart';

class CategoriesController extends GetxController {
  List<CategoriesModel> _categoriesList = <CategoriesModel>[].obs;

  RxMap<int, dynamic> _recipesMap = <int, dynamic>{}.obs;

  RxBool isTextFieldNull = false.obs;

  RxInt indexRecipe = 0.obs;

  List<CategoriesModel> get categoriesList => _categoriesList;

  RxMap<int, dynamic> get recipesMap => _recipesMap;

  void addItem({required String name}) {
    _categoriesList.add(CategoriesModel(name: name));
  }

  void addRecipe({required int index, required String name}) {
    _recipesMap[index] = TypeOfCategoriesModel(typeName: name).typeName;
  }
}
