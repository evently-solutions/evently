import 'package:evently/screens/login_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      image: DecorationImage(
                          image:
                              AssetImage('assets/samples/profile_picture.jpg'),
                          fit: BoxFit.cover)),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Brian Tardif',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        height: 40.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Color.fromRGBO(18, 144, 203, 1.0),
                        ),
                        child: Center(
                            child: Text(
                          '+ Follow',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontSize: 12.0),
                        )),
                      )
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Phoenix, AZ',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.grey,
                      fontSize: 15.0),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
                child: Text(
                  'Hi, I\'m Brian. I love attending sporting events and comedy shows.',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w300,
                      fontSize: 15.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '1789',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.red,
                              fontSize: 17.0),
                        ),
                        Text(
                          'Followers',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '236',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.blue,
                              fontSize: 17.0),
                        ),
                        Text(
                          'Following',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '990',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.red,
                              fontSize: 17.0),
                        ),
                        Text(
                          'Likes',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.grey,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 25.0),
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                height: 200.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      height: 200.0,
                      width: 200.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/other/picone.jpeg'),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(width: 10.0),
                    Container(
                      height: 200.0,
                      width: 200.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/other/pictwo.jpeg'),
                              fit: BoxFit.cover)),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                height: 100.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/other/picthree.jpeg'),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(width: 10.0),
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/other/picfour.jpeg'),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(width: 10.0),
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/other/picfive.jpeg'),
                              fit: BoxFit.cover)),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
