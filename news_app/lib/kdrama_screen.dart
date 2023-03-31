import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app/detail_kdrama_screen.dart';
import 'package:news_app/detail_news_screen.dart';
import 'package:news_app/model/Article.dart';
import 'package:news_app/model/kdrama.dart';

class KdramaScreen extends StatelessWidget {
  static const routeName = '/kdrama_list';
  const KdramaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Kdrama App'),
        ),
        body: ListView.builder(
          itemCount: koreanDramaList.length,
          itemBuilder: (context, index) {
            final KoreanDrama kdrama = koreanDramaList[index];
            return InkWell(onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: 
              (context){
                return DetailKdramaScren(kdrama: kdrama );
              }));
            },child: Card(
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(flex:1,child:Image.asset(kdrama.banner)),
                  Expanded(flex: 2, 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(kdrama.name, style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 10),
                      Text(kdrama.broadcaster)
                    ],
                  ), )
                ]
              ),
            ));
          },
        ));
  }
}

Widget buildItem(BuildContext context, Article article) {
  return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Image.network(article.urlToImage, width: 100),
      title: Text(article.title),
      subtitle: Text(article.author),
      onTap: () {
        Navigator.pushNamed(context, DetailNewsScreen.routeName,
            arguments: article);
      });
}
