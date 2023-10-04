import 'package:flutter/material.dart';
import 'package:thenews/Ui/screens/home/search_screen.dart';
import 'package:thenews/Ui/screens/home/tabs/category_tap/categories_tab.dart';
import 'package:thenews/Ui/screens/home/tabs/news_tap/news_tab.dart';
import 'package:thenews/model/category_dm.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
static String routename="homescreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
CategoryDM ?categoryDM;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("${AppLocalizations.of(context)!.newsApp}" ,style: const TextStyle(color: Colors.white,fontSize: 25),),
        actions:   [
          InkWell(
            onTap: () {
              showSearch(context: context, delegate: Search());
            },
              child: const Icon(Icons.search,size: 30,))
        ],
        shape:const RoundedRectangleBorder(borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20)
        )) ,
      ),
      body: categoryDM==null? CategoriesTab(setcatorgryDm): NewsTap(categoryDM!),
    );
  }

  void setcatorgryDm(CategoryDM newcategry){
    categoryDM=newcategry;
    setState(() {
    });
  }
}