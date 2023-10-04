// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../../../../model/category_dm.dart';


class Category extends StatelessWidget {
  CategoryDM categoryDM;
  Category(this.categoryDM, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: const Radius.circular(12),
              topLeft: const Radius.circular(12),
              bottomRight: categoryDM.isLeftSided ? Radius.zero : const Radius.circular(12),
              bottomLeft: categoryDM.isLeftSided ? const Radius.circular(12) :Radius.zero
          ),
          color: categoryDM.backgroundColor
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(categoryDM.imagePath),
          const Spacer(),
          Text(categoryDM.title, style: const TextStyle(color: Colors.white, fontSize: 18),)
        ],
      ),
    );
  }
}