import 'package:flutter/material.dart';
import 'package:thenews/model/ArticlesResponce.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../utils/app_colors.dart';
import '../../utils/constans.dart';


class NewsDetailes extends StatelessWidget {
  const NewsDetailes({super.key});

  static String routename = "News Detailes";

  @override
  Widget build(BuildContext context) {
    var articles = ModalRoute
        .of(context)!
        .settings
        .arguments as Articles;
    DateTime time = DateTime.parse(articles.publishedAt ?? "").toUtc();
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green,
        title: Text(articles.title ?? AppLocalizations.of(context)!.newsApp,
          style: const TextStyle(color: Colors.white, fontSize: 15),),
        centerTitle: true,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        )),
      ),
      body: Container(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                const CircularProgressIndicator(),
                Hero(
                  tag: "News_image",
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child:
                    Image.network(
                      articles.urlToImage ?? Constance.imagePlaceHolder,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * .25,
                      width: double.infinity, fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6,),
            Text(articles.source?.name ?? "", textAlign: TextAlign.start,
              style: const TextStyle(color: AppColors.font1, fontSize: 10),),
            const SizedBox(height: 4,),
            Text(articles.title ?? "", textAlign: TextAlign.start,
              style: const TextStyle(color: AppColors.font2, fontSize: 15),),
            const SizedBox(height: 4,),
            Text(articles.description ?? "", textAlign: TextAlign.start,
                style: const TextStyle(color: AppColors.font2,
                    fontSize: 14,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 4,),
            Text("${time.day}/${time.month}/${time.year}",
                textAlign: TextAlign.end,
                style: const TextStyle(color: AppColors.font2, fontSize: 13,)),
            const SizedBox(height: 4,),
            Text(articles.content ?? "", textAlign: TextAlign.start,
              style: const TextStyle(color: AppColors.font2, fontSize: 15),),
            const SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      _launchUrl(articles.url ?? "");
                    },
                    child: const Text("view Full Artcile ",
                      style: TextStyle(color: Colors.black, fontSize: 18,),)),
                const Icon(Icons.arrow_forward_ios_outlined,)
              ],
            )

          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    var url0 = Uri.parse(url);

    if (!await launchUrl(url0, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url0');
    }
  }
}
