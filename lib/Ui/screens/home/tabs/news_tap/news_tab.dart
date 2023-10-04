import 'package:flutter/material.dart';
import 'package:thenews/Ui/screens/home/tabs/news_tap/articles_list.dart';
import 'package:thenews/date/api_manger.dart';
import 'package:thenews/model/SourcesResponce.dart';
import 'package:thenews/model/category_dm.dart';

// ignore: must_be_immutable
class NewsTap extends StatefulWidget {
  CategoryDM? categoryDM;
NewsTap(this.categoryDM, {super.key});
  @override
  State<NewsTap> createState() => _NewsTapState();
}
int currentTab = 0;
List<Source> sources = [];

class _NewsTapState extends State<NewsTap> {
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<SourcesResponce>(
        future:ApiManager.getSources(widget.categoryDM!.id) ,
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }else if(snapshot.hasData){
           // ignore: avoid_print
           print(snapshot.data!.sources![0].id);
           return buildTabsWidgets(snapshot.data!.sources!);
          }else{
            return const Center(child: CircularProgressIndicator());
          }


        },);

  }

  Widget buildTabsWidgets(List<Source> sources){
    return DefaultTabController(
        length: sources.length,
        child: Column(
          children: [
            const SizedBox(height: 8,),
            TabBar(
                onTap: (index){
                  currentTab = index;
                  setState(() {});
                },
                isScrollable: true,
                indicatorColor: Colors.transparent,
                tabs: sources.map(
                        (source) => buildTabWidget(source,
                        currentTab == sources.indexOf(source))
                ).toList()),
            Expanded(
                child:TabBarView(
                  children: sources.map((sources) => ArticlesList(sources)).toList(),
                )
            )

          ],
        )
    );
  }

  Widget buildTabWidget(Source source, bool isSelected){
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green, width: 2),
          borderRadius: BorderRadius.circular(16),
          color: isSelected ?Colors.green: Colors.white
      ),
      child: Text(source.name??"",
        style: TextStyle(color: isSelected? Colors.white: Colors.green),),
    );
  }
}

