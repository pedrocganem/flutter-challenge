import 'package:flutter/material.dart';

class SnowFAQAppBar  {
  final String title;

  const SnowFAQAppBar({this.title});
  
  Widget appBar(BuildContext context) {
    return AppBar(
      brightness: Theme.of(context).appBarTheme.brightness,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8.0))),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
