import 'package:flutter/material.dart';

class FindEvent extends StatelessWidget {
  List<String> items = ['1', '2', '3', '4', '5', '6', '7'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {},
//              controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(8.0),
                    height: 150,
                    child: Card(
                      elevation: 8,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Image.network(
                                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('${items[index]}'),
                                      Text('some other text'),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}