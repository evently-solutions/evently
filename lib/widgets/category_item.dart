import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imagePath;
  final Color color;

  CategoryItem(this.id, this.title, this.imagePath, this.color);

  void selectCategory(BuildContext context) {
//    Navigator.of(context).pushNamed(
//      CategoryMealsScreen.routeName,
//      arguments: {
//        'id': id,
//        'title': title,
//      },
//    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 5),),
              child: Image.asset(
                imagePath,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              color: Colors.black38,
              child: Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}