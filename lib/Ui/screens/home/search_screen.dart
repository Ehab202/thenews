import 'package:flutter/material.dart';
import 'package:thenews/Ui/screens/home/tabs/news_tap/articles_widget.dart';
import 'package:thenews/date/api_manger.dart';

import '../../../model/ArticlesResponce.dart';
import '../../../model/SourcesResponce.dart';

class Search extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query="";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }
  late Source source;
  @override
  Widget buildResults(BuildContext context) {
    
    return FutureBuilder<ArticlesResponce>(
        future: ApiManager.getNewsSearch(query),
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

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<ArticlesResponce>(
        future: ApiManager.getNewsSearch(query),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return const Center(child: Icon(Icons.search));
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

}
