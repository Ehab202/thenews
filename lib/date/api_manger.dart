import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:thenews/model/ArticlesResponce.dart';

import 'package:thenews/model/SourcesResponce.dart';




abstract class ApiManager{
  static const String baseUrl = "https://newsapi.org";
  static const String sourcesEndPoint = "/v2/top-headlines/sources";
  static const String everyThingEndPoint = "/v2/everything";
  static const String apiKey = "5f3c9bb39b4945f8902943cb4f27cd37";

  static Future<SourcesResponce> getSources(String category) async{
    http.Response response =
    await http.get(Uri.parse("$baseUrl$sourcesEndPoint?apiKey=$apiKey&category=$category"));

   SourcesResponce  sourcesResponse =
    SourcesResponce.fromJson(jsonDecode(response.body));

    if(response.statusCode >= 200 && response.statusCode < 300){
      return sourcesResponse;
    }else {
      throw Exception(sourcesResponse.massage??"Something went wrong please try again later");
    }
  }

  static Future<ArticlesResponce> getArticles(String sourceId) async {
    http.Response response =
    await http.get(Uri.https("newsapi.org",everyThingEndPoint, {
      "apiKey": apiKey,
      "sources": sourceId}));
    ArticlesResponce articlesResponse =
    ArticlesResponce.fromJson(jsonDecode(response.body));
    if(response.statusCode >= 200 && response.statusCode < 300){
      return articlesResponse;
    }else {
      throw Exception(articlesResponse.massage?? "Something went wrong please try again later");
    }
  }
  static Future<ArticlesResponce> getNewsSearch(String quary) async {
    http.Response response =
    await http.get(Uri.https("newsapi.org",everyThingEndPoint, {
      "apiKey": apiKey,
      "q":quary}));
    ArticlesResponce articlesResponse =
    ArticlesResponce.fromJson(jsonDecode(response.body));
    if(response.statusCode >= 200 && response.statusCode < 300){
      return articlesResponse;
    }else {
      throw Exception(articlesResponse.massage?? "Something went wrong please try again later");
    }
  }
}