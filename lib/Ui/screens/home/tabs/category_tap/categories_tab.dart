
import 'package:flutter/material.dart';
import '../../../../../model/category_dm.dart';
import 'category.dart';

// ignore: must_be_immutable
class CategoriesTab extends StatelessWidget {
  Function onCategryclick;
   CategoriesTab(this.onCategryclick, {super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(6.0),
          child: Text("Pick your category of intereset", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: GridView.builder(
              itemCount: 6,
              itemBuilder: (context, index){
                return InkWell(
                    onTap: (){
                      onCategryclick(CategoryDM.categories[index]);
                    },
                    child: Category(CategoryDM.categories[index]));
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8
              ),
            ),
          ),
        )
      ],
    ) ;
  }
}