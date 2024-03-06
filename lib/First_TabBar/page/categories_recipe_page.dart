import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:receitas_app/First_TabBar/controller/categories_controller.dart';

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
            Text(widget.index.toString()),
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
                        index: widget.index,
                        name: recipeNameController.text,
                      );
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
              return c.recipesList.isEmpty
                  ? Text('Nenhuma Receita adicionada')
                  : Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: c.recipesList[widget.index]!.length,
                        separatorBuilder: (_, __) => Divider(),
                        itemBuilder: (context, index) {
                          final item =
                              c.recipesList[widget.index]![index].typeName;
                          return Container(
                            height: 200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  item,
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
