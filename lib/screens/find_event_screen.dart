import 'package:evently/constants/event_categories.dart';
import 'package:evently/widgets/category_item.dart';
import 'package:flutter/material.dart';

class FindEventScreen extends StatelessWidget {
  static const routeName = '/findEvent';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.all(15),
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white),
                    child: TextField(
                      onChanged: (value) {},
//              controller: editingController,
                      decoration: InputDecoration(
                        labelText: "Search",
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.clear),),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(0, 25, 0, 10),
              child: Text(
                'Browse Categories',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            Expanded(
              child: GridView(
                children: categories
                    .map((data) =>
                    CategoryItem(
                        data.id, data.title, data.imagePath, data.color))
                    .toList(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
