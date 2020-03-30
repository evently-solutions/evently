import 'package:evently/constants/event_categories.dart';
import 'package:evently/models/eventful_search_result.dart';
import 'package:evently/services/eventful/eventful_client.dart';
import 'package:evently/widgets/category_item.dart';
import 'package:evently/widgets/event_card.dart';
import 'package:flutter/material.dart';

class FindEventScreen extends StatefulWidget {
  static const routeName = '/findEvent';

  @override
  _FindEventScreenState createState() => _FindEventScreenState();
}

class _FindEventScreenState extends State<FindEventScreen> {
  bool keywordSearch = false;
  EventfulSearchResult eventfulSearchResult;

  Color firstColor = Color(0xFFF47D25);
  Color secondColor = Color(0xFFEF772C);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          searchPart(),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(0, 25, 0, 10),
            child: Text(
              'Browse Categories',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.black87,
                  fontFamily: 'Montserrat'),
            ),
          ),
          browsePart(),
        ],
      ),
    );
  }

  Widget searchPart() {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor
                ],
              ),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  'What would you like to do?',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                    child: TextField(
                      onChanged: (text) {},
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontFamily: 'Montserrat',
                      ),
//                      cursorColor: appTheme.primaryColor,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 14.0),
                        suffixIcon: Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                          child: InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget browsePart() {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: buildCategoryWidgets(),
        ),
      ),
    );
  }

  static List<Widget> buildCategoryWidgets() {
    List<Widget> categoryWidgetList = [];
    print(categories);
    categories.forEach((item) => {
          categoryWidgetList
              .addAll([CategoryItem(item.id, item.title, item.imagePath), SizedBox(width: 10,)])
        });
    return categoryWidgetList;
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height);

    var firstEndPoint = Offset(size.width * .5, size.height - 30.0);
    var firstControlpoint = Offset(size.width * 0.25, size.height - 50.0);
    path.quadraticBezierTo(firstControlpoint.dx, firstControlpoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 80.0);
    var secondControlPoint = Offset(size.width * .75, size.height - 10);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
