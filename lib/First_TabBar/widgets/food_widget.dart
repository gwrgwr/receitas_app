import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:receitas_app/First_TabBar/controller/categories_controller.dart';
import 'package:receitas_app/First_TabBar/models/recipes_model.dart';
import 'package:receitas_app/First_TabBar/page/recipes_page.dart';

class FoodWidget extends StatefulWidget {
  const FoodWidget({super.key});

  @override
  State<FoodWidget> createState() => _FoodWidgetState();
}

class _FoodWidgetState extends State<FoodWidget> {
  @override
  Widget build(BuildContext context) {
    final CategoriesController c = Get.put(CategoriesController());
    TextEditingController categorieNameController = TextEditingController();
    final newRecipes = <RecipesModel>[];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        children: [
          Obx(() {
            return TextField(
              controller: categorieNameController,
              cursorColor: Colors.black,
              style: TextStyle(fontFamily: 'RobotoMono'),
              decoration: InputDecoration(
                error: c.isTextFieldNull.value
                    ? Text(
                        'Tente escrever algo antes de adicionar!',
                        style: TextStyle(color: Colors.red),
                      )
                    : null,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintStyle: TextStyle(
                    color: Colors.blueGrey.withOpacity(0.6),
                    fontFamily: 'NunitoSans'),
                hintText: "Adicionar nova categoria",
                suffixIcon: CircleAvatar(
                  backgroundColor: Colors.blueGrey.withOpacity(0.6),
                  child: IconButton(
                    onPressed: () {
                      if (categorieNameController.text.isNotEmpty) {
                        c.addItem(
                          name: categorieNameController.text,
                          recipes: newRecipes,
                        );
                        categorieNameController.clear();
                        c.isTextFieldNull.value = false;
                      } else {
                        c.isTextFieldNull.value = true;
                      }
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          }),
          Divider(height: 30),
          Obx(
            () {
              return c.categoriesList.isEmpty
                  ? Center(
                      child: Text(
                        'Nenhuma categoria adicionada',
                        style: TextStyle(
                          color: Colors.blueGrey.withOpacity(0.6),
                          fontSize: 19,
                          fontFamily: 'NunitoSans',
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 130,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: c.categoriesList.length,
                        separatorBuilder: (_, __) => SizedBox(width: 15),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => RecipesPage(index: index));
                            },
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: Colors.blueGrey.withOpacity(0.4)),
                                color: index.isEven
                                    ? Color.fromARGB(255, 200, 238, 157)
                                        .withOpacity(0.6)
                                    : Color.fromARGB(255, 116, 103, 235),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Column(
                                  children: [
                                    Text(
                                      c.categoriesList[index].name,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'RobotoMono',
                                        color: Colors.black,
                                      ),
                                    ),
                                     Text("")
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
