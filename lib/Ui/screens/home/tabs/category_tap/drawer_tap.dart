import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:thenews/Ui/screens/home/tabs/category_tap/categories_tab.dart';
import 'package:thenews/Ui/screens/home/tabs/settings.dart';

Drawer buildDrawer(BuildContext context){
  AppLocalizations appLocalizations = AppLocalizations.of(context)!; 
   Function?onCategryclick;
   return Drawer(
      child : Column(
        children: [
          Container(
                  height: 150,  
                  width: double.infinity,  
                  color: Colors.green, 
                  child: Center(child: Text("${appLocalizations.newsApp}!",style: const TextStyle( color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),))),   
         const SizedBox(height: 25,),
        builtDrawerChoice(() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>CategoriesTab(onCategryclick!),)), Icons.list, appLocalizations.categories),          
        const SizedBox(height: 18,),
        builtDrawerChoice(() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SettingsTap(),)), Icons.settings, appLocalizations.settings)
        ],));}
Widget builtDrawerChoice(Function() function,IconData icon,String text){
  return InkWell(
    onTap: function,
    child: Row(
      children: [
        const SizedBox(width: 10,),
        Icon(icon,size: 40,color: Colors.black,),
         const SizedBox(width: 15,),
        Text( text,style: const TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),)
  ],));}