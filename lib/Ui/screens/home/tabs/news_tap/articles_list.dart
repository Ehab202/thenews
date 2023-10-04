import 'package:flutter/material.dart';
import 'package:thenews/Ui/screens/home/tabs/news_tap/articles_widget.dart';
import '../../../../../date/api_manger.dart';
import '../../../../../model/ArticlesResponce.dart';
import '../../../../../model/SourcesResponce.dart';

// ignore: must_be_immutable
class ArticlesList extends StatelessWidget {
  Source source;
  ArticlesList(this.source, {super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticlesResponce>(
        future: ApiManager.getArticles(source.id!),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return Center(child: Text("${snapshot.error}"));
          }else if(snapshot.hasData){
            // ignore: avoid_print
            print(snapshot.data);
            return buildArticlesList(snapshot.data!.articles!);
          }else {
            return const Center(child: CircularProgressIndicator());
          }
        }
    );
  }
  Widget buildArticlesList(List<Articles> articles){
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index){
          return ArticlesWidget(articles[index]);
        }
    );
  }
}
