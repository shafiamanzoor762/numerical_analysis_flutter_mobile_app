import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../customWigets/image_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffdad2f9),
          elevation: 2,
          title: Text("Home"),
          centerTitle: true,
        ),
        body: Container(
            color: Color(0xff8878c3),
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                    items: [
                      'assets/images/image1.jpeg',
                      'assets/images/image2.jpeg',
                      'assets/images/image3.jpeg',
                    ].map((item) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Image.asset(
                            item,
                            fit: BoxFit.cover,
                          );
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Hi! HERE HOW TO USE THIS APP? \n\t\t DEMO',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'ComicNeue',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  const BorderedImage(
                    imagePath: 'assets/images/image4.jpg',
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: DataTable(
                      columns: [
                        DataColumn(
                            label: Text('Name',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'ComicNeue',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))),
                        DataColumn(label: Text('Age')),
                        DataColumn(label: Text('Role')),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text('John')),
                          DataCell(Text('30')),
                          DataCell(Text('Developer')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Alice')),
                          DataCell(Text('25')),
                          DataCell(Text('Designer')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Bob')),
                          DataCell(Text('35')),
                          DataCell(Text('Manager')),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
