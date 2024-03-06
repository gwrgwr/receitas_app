import 'package:get/get.dart';
import 'package:receitas_app/First_TabBar/models/categories_model.dart';
import 'package:receitas_app/First_TabBar/models/type_of_categories_model.dart';

class CategoriesController extends GetxController {
  List<CategoriesModel> _categoriesList = <CategoriesModel>[].obs;

  RxMap<int, List<dynamic>> _recipesList = <int, List<dynamic>>{}.obs;

  RxBool isTextFieldNull = false.obs;

  RxInt indexRecipe = 0.obs;

  List<CategoriesModel> get categoriesList => _categoriesList;

  RxMap<int, List<dynamic>> get recipesList => _recipesList;

  void addItem({required String name}) {
    _categoriesList.add(CategoriesModel(name: name));
  }

  void addRecipe({required int index, required String name}) {
    _recipesList[index] = [...?_recipesList[index], TypeOfCategoriesModel(typeName: name)];
    print("NOME TO BAGULHO ${_recipesList[index]?.length}");
  }
}
