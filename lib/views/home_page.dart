import 'package:flutter/material.dart';
import 'package:receitas_app/First_TabBar/widgets/food_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text('Receitas'),
          centerTitle: true,
        ),
        body: TabBarView(
          children: [FoodWidget(), Icon(Icons.arrow_back), Icon(Icons.menu)],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.fastfood_rounded)),
            Tab(icon: Icon(Icons.arrow_back)),
            Tab(icon: Icon(Icons.menu))
          ],
        ),
      ),
    );
  }
}
