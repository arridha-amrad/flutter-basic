import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> _imagePaths = [
    "images/img1.jpg",
    "images/img2.jpg",
    "images/img3.jpg",
    "images/img4.jpg",
    "images/img5.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carousel"),
      ),
      // ignore: missing_required_param
      body: CarouselSlider(
        options: CarouselOptions(autoPlay: true),
        items: _imagePaths.map((e) {
          return Builder(builder: (BuildContext context) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                e,
                fit: BoxFit.cover,
              ),
            );
          });
        }).toList(),
      ),
    );
  }
}
