import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app/model/Article.dart';
import 'package:news_app/model/kdrama.dart';
import 'package:news_app/more_news.dart';
import 'package:news_app/widgets/favorite_button.dart';

class DetailKdramaScren extends StatelessWidget {
  static const routeName = '/detail_news_list';
  final  KoreanDrama kdrama;
  const DetailKdramaScren({Key? key, required this.kdrama});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(kdrama.name),
        ),
        body: SingleChildScrollView(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children:<Widget> [
            Stack(
              children:
              <Widget>[Image.asset(kdrama.banner),
              SafeArea(child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.amber,),
                        onPressed: (){
                          //kembali ke tampilan sebelumnya 
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  const FavoriteButton(), 
                  ],
                ),
              ))]
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Text(kdrama.name,
              textAlign: TextAlign.center,
              style:  TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto'
              ),),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    Column(
                      children:<Widget>[
                        Icon(Icons.calendar_today),
                        SizedBox(height: 8.0,),
                        Text(kdrama.schedule)
                      ],
                    ),
                    Column(
                      children:<Widget>[
                        Icon(Icons.favorite),
                        SizedBox(height: 8.0,),
                        Text(kdrama.numEpisodes.toString())
                      ],
                    )
                ],
              )
            ),
            Container(
              margin: const EdgeInsets.all(16.0),
              child: const Text(
                "A powerful blabla",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: kdrama.imageUrls.map((url) {
                  return Padding(padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(url),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        )));
  }
}
