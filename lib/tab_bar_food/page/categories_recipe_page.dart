import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:receitas_app/tab_bar_food/controller/categories_controller.dart';

class CategorieRecipesPage extends StatefulWidget {
  CategorieRecipesPage({required this.index, super.key});

  final int index;

  @override
  State<CategorieRecipesPage> createState() => _CategorieRecipesPageState();
}

class _CategorieRecipesPageState extends State<CategorieRecipesPage> {
  final CategoriesController c = Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    final item = c.categoriesList[widget.index];
    final itemNameCapitalized =
        item.name.split(' ').map((word) => word.capitalize!).join(' ');
    final TextEditingController recipeNameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(itemNameCapitalized),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemNameCapitalized,
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoMono',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: recipeNameController,
              cursorColor: Colors.black,
              style: TextStyle(fontFamily: 'RobotoMono'),
              decoration: InputDecoration(
                hintText: "Adicionar nova receita",
                hintStyle: TextStyle(
                    color: Colors.blueGrey.withOpacity(0.6), height: 3),
                suffixIcon: CircleAvatar(
                  backgroundColor: Colors.blueGrey.withOpacity(0.6),
                  child: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      c.addRecipe(
                        index: c.indexRecipe.value,
                        name: recipeNameController.text,
                      );
                      c.indexRecipe.value++;
                      recipeNameController.clear();
                    },
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 30),
            Obx(() {
              return c.recipesMap.isEmpty
                  ? Text('Nenhuma Receita adicionada')
                  : Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: c.recipesMap.keys.length,
                      separatorBuilder: (_, __) => Divider(),
                      itemBuilder: (context, index) {
                        final key = c.recipesMap.keys.elementAt(index);
                        return Container(
                          height: 200,
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                            children: [
                              Text("${key + 1}"),
                              Text(
                                c.recipesMap[index],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'NunitoSans',
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
            }),
          ],
        ),
      ),
    );
  }
}
