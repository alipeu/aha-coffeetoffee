import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            imageLocation: 'images/cat_cstraw.png',
            imageCaption: 'Blended',
          ),

          Category(
            imageLocation: 'images/cat_espresso.png',
            imageCaption: 'Espresso',
          ),
          
          Category(
            imageLocation: 'images/cat_cup.png',
            imageCaption: 'Brewed',
          ),

          Category(
            imageLocation: 'images/cat_cake.png',
            imageCaption: 'Desserts',
          ),

          Category(
            imageLocation: 'images/cat_sandwich.png',
            imageCaption: 'Foods',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;

  Category({
    this.imageLocation,
    this.imageCaption
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: (){},
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(
              imageLocation,
              width: 100.0,
              height: 80.0,
              ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(imageCaption),
            ),
          ),
        ),
      ),
    );
  }
}