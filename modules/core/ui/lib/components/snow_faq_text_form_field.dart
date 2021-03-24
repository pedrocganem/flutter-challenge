import 'package:flutter/material.dart';

class SnowFAQTextFormField {
  final Function onStartedTyping;
  final int maxLines;
  final String title;
  final bool autofocus;
  SnowFAQTextFormField(this.onStartedTyping, this.maxLines, this.title, this.autofocus);

  Widget textFormField(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      onChanged: onStartedTyping,
      maxLines: maxLines,
      style: Theme.of(context).textTheme.headline4,
      decoration: InputDecoration(
        labelText: title,
        labelStyle: Theme.of(context).textTheme.subtitle1,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
    );
  }
}
