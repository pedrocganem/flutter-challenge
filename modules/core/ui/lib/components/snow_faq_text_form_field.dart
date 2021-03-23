import 'package:flutter/material.dart';

class SnowFAQTextFormField {
  final Function onStartedTyping;
  final int maxLines;
  final String title;
  SnowFAQTextFormField(this.onStartedTyping, this.maxLines, this.title);

  Widget textFormField
  (BuildContext context) {
    return TextFormField(
      onChanged: onStartedTyping,
      maxLines: maxLines,
      style: Theme.of(context).textTheme.headline4,
      decoration: InputDecoration(
        labelText: title, 
        labelStyle: Theme.of(context).textTheme.subtitle1,
        
      ),
    );
  }

}