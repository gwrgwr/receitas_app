import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:receitas_app/First_TabBar/controller/categories_controller.dart';
import 'package:receitas_app/First_TabBar/models/recipes_model.dart';

class RecipesPage extends StatefulWidget {
  RecipesPage({required this.index, super.key});

  int index;

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  @override
  Widget build(BuildContext context) {
    final CategoriesController c = Get.find<CategoriesController>();
    final TextEditingController recipeNameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(c.categoriesList[widget.index].name),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            TextField(
              cursorColor: Colors.black,
              controller: recipeNameController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    c.addRecipeToCategory(
                      widget.index,
                      RecipesModel(recipeName: recipeNameController.text),
                    );
                    recipeNameController.clear();
                  },
                  icon: CircleAvatar(
                    backgroundColor: Colors.blueGrey.withOpacity(0.6),
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
                ),
                enabledBorder: UnderlineInputBorder(),
                focusedBorder: UnderlineInputBorder(),
                hintText: "Adicionar nova receita",
                hintStyle: TextStyle(
                  color: Colors.blueGrey.withOpacity(0.6),
                  fontFamily: 'NunitoSans',
                ),
              ),
            ),
            SizedBox(height: 30),
            Obx(
              () {
                if (c.recipesList.isEmpty ||
                    c.recipesList[widget.index] == null ||
                    c.recipesList[widget.index]!.recipes.isEmpty) {
                  return Text('Nenhuma receita adicionada ainda!');
                } else {
                  return Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final recipe = c.recipesList[widget.index]!.recipes[index];
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: index.isEven
                                ? Color.fromARGB(255, 116, 103, 235)
                                : Color.fromARGB(255, 200, 238, 157)
                                .withOpacity(0.6),
                          ),
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("${recipe.recipeName}"),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          Divider(height: 20),
                      itemCount: c.recipesList[widget.index]!.recipes.length,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}