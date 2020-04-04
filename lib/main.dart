import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';




void main() {
  runApp(MaterialApp(
    title: 'Flutter Tutorial',
    home: TutorialHome(),
  ));
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Components.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text('Carousel'),
        actions: <Widget>[

        ],
      ),
      // body is the majority of the screen.
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildHeader(),
            Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200
              ),
              child: Text('7 Tahun sebagai technical support dan berpengalaman dalam setup server'),
            ),

            buildCarouselSlider(),

            buildTitle('Social Media'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 20.0,),
                IconButton(
                  iconSize: 18.0,
                  color: Colors.indigo,
                  icon: Icon(FontAwesomeIcons.facebookF),
                  onPressed: (){},
                ),
                SizedBox(width: 10.0,),
                IconButton(
                  iconSize: 18.0,
                  color: Colors.black,
                  icon: Icon(FontAwesomeIcons.githubAlt),
                  onPressed: (){},
                ),
                SizedBox(width: 10.0,),
                IconButton(
                  iconSize: 18.0,
                  color: Colors.blue,
                  icon: Icon(FontAwesomeIcons.twitter),
                  onPressed: (){},
                ),
                SizedBox(width: 10.0,),
                IconButton(
                  iconSize: 18.0,
                  color: Colors.grey,
                  icon: Icon(FontAwesomeIcons.medium),
                  onPressed: (){},
                ),
                SizedBox(width: 10.0,),
                IconButton(
                  iconSize: 18.0,
                  color: Colors.blue,
                  icon: Icon(FontAwesomeIcons.linkedin),
                  onPressed: (){},
                ),
                SizedBox(width: 10.0,),
                IconButton(
                  iconSize: 18.0,
                  color: Colors.purple,
                  icon: Icon(FontAwesomeIcons.instagram),
                  onPressed: (){},
                ),
                SizedBox(width: 10.0,),
              ],
            ),


          ],
        ),
      ),
    );
  }

  CarouselSlider buildCarouselSlider() {
    return CarouselSlider(
            height: 400.0,
            items: [
              "http://wandisyahid.id/images/Tips Sebelum Masuk dan Keluar Rumah-01.jpg",
              "http://wandisyahid.id/images/Tips Sebelum Masuk dan Keluar Rumah-02.jpg",
              "http://wandisyahid.id/images/Status Tanggap Darurat Bencana COVID-19.jpg",
              "http://wandisyahid.id/images/Tunda Mudik dan Piknik.jpg"].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(color: Colors.amber),
                      child: GestureDetector(
                          child: Image.network(i, fit: BoxFit.fill),
                          onTap: () {
                            Navigator.push<Widget>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ImageScreen(i),
                              ),
                            );
                          }));
                },
              );
            }).toList(),
          );
  }






  ListTile buildExperience({String company, String position, String duration}) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 20.0),
        child: Icon(FontAwesomeIcons.solidCircle, size: 12.0, color: Colors.black54,),
      ),
      title: Text(company, style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,

      ),),
      subtitle: Text("$position($duration)"),
    );
  }



  Padding buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 16.0),
      child: Text(title.toUpperCase(), style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,

      ),),
    );
  }

  Row buildHeader() {
    return Row(children: <Widget>[
      SizedBox(width: 20.0,),
      Container(
          padding: const EdgeInsets.only(top: 20),
          width: 80.0,
          child: Image.asset('images/pic-profile.jpg')),
      SizedBox(width: 20.0,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Wandi Syahid', style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold
          ),),
          Text('Manager of Technical Support'),

          Row(
            children: <Widget>[
              Icon(Icons.location_on, color:
              Colors.grey,),
              Text('Jakarta, Indonesia'),
            ],
          ),
        ],
      )
    ],);
  }
}


class ImageScreen extends StatefulWidget {
  final String url;
  ImageScreen(this.url);

  @override
  _MyImageScreen createState() => _MyImageScreen(url);
}

class _MyImageScreen extends State<ImageScreen> {
  final String url;
  _MyImageScreen(this.url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Informasi Corona'),
        ),
        body: Image.network(url, width: double.infinity));
  }
}
