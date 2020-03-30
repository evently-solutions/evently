import 'package:flutter/cupertino.dart';

class Header extends StatelessWidget {
  final String title;

  Header(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }
}
