import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      child: Center(
        child: Container(
          height: 300,
          width: 350,
          child: Card(
            elevation: 20,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (value) {},
//              controller: editingController,
                      decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "Email",
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (value) {},
//              controller: editingController,
                      decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)))),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width,
                    height: 75,
//              color: Colors.lightBlue,
                    child: RaisedButton(
                      onPressed: () {},
                      color: Colors.lightBlue,
                      disabledColor: Colors.lightBlue,
                      child: Text('Login', style: TextStyle(color: Colors.black54, fontSize: 16),),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
