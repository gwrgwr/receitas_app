import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:receitas_app/tab_bar_food/controller/categories_controller.dart';
import 'package:receitas_app/views/categories_recipe_page.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: ListView(
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
                hintText: "Adicionar nova tarefa",
                suffixIcon: CircleAvatar(
                  backgroundColor: Colors.blueGrey.withOpacity(0.6),
                  child: IconButton(
                    onPressed: () {
                      if (categorieNameController.text.isNotEmpty) {
                        c.addItem(name: categorieNameController.text);
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
                      height: 550,
                      child: ListView.separated(
                        itemCount: c.categoriesList.length,
                        separatorBuilder: (_, __) => SizedBox(height: 20),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => CategorieRecipesPage(index: index));
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: Colors.blueGrey.withOpacity(0.4)),
                                color: Color(0xffdddddd).withOpacity(0.6),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      c.categoriesList[index].name,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'RobotoMono',
                                        color: Colors.black,
                                      ),
                                    ),
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
