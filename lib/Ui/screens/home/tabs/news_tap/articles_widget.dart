// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:thenews/Ui/screens/home/new_detailes.dart';
import 'package:thenews/Ui/utils/app_colors.dart';
import 'package:thenews/Ui/utils/constans.dart';
import 'package:thenews/model/ArticlesResponce.dart';

class ArticlesWidget extends StatelessWidget {
  Articles article;
  ArticlesWidget(this.article, {super.key});

  @override
  Widget build(BuildContext context) {
    DateTime time= DateTime.parse(article.publishedAt??"").toUtc();
    return  InkWell(
      onTap:() {
        Navigator.pushNamed(context, NewsDetailes.routename ,arguments: article);
      },
      child: Card(
        elevation: 16,
        margin: const EdgeInsets.all(8),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.transparent)
        ),
        child: Container(
          padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child:
                      Image.network(article.urlToImage??Constance.imagePlaceHolder,
                        height: MediaQuery.of(context).size.height*.25,
                        width: double.infinity,fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6,),
                Text(article.source?.name??"",textAlign: TextAlign.start,style: const TextStyle(color:AppColors.font1,fontSize: 10),),
                const SizedBox(height: 4,),
                Text(article.description??"",textAlign: TextAlign.start,maxLines: 2,style: const TextStyle(color:AppColors.font2,fontSize: 14,fontWeight: FontWeight.w500)),
                const SizedBox(height: 4,),
                Text("${time.day}/${time.month}/${time.year}",textAlign: TextAlign.end,style: const TextStyle(color:AppColors.font2,fontSize: 13,)),
                const SizedBox(height: 4,),
              ],
            ),
          ),
      ),
    );
  }
}
