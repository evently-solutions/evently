import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final String imagePath;
  final Color color;

  const Category({
    @required this.id,
    @required this.title,
    @required this.imagePath,
    this.color = Colors.orange,
  });
}
