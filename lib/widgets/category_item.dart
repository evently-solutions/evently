import 'package:evently/screens/search_results_screen.dart';
import 'package:evently/services/eventful/eventful_client.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imagePath;

  CategoryItem(this.id, this.title, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width / 2,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(SearchResultsScreen.routeName,
              arguments: {'searchType': 'category', 'id': id, 'title': title});
        },
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: Container(
                child: Image.asset(
                  imagePath,
                  height: MediaQuery.of(context).size.height / 5,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              right: 10,
              child: Container(
                color: Colors.black38,
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
