import 'package:flutter/material.dart';

/// Class Label
class Label extends Text {

  // Constructor default
  Label(
      String label, {
        Key key,
        FontWeight fontWeight = FontWeight.normal,
        double fontSize = 18,
        Color fontColor = Colors.black38,
        bool italic = false,
      }): super(
      label,
      key: key,
      style: TextStyle(
        decoration: TextDecoration.none,
        color: fontColor,
        fontFamily: 'Roboto',
        fontWeight: fontWeight,
        fontStyle: italic ? FontStyle.italic : FontStyle.normal,
        fontSize: fontSize,
      ));

  // Constructor rich
  Label.rich(
      TextSpan text, {
        Key key,
        FontWeight fontWeight = FontWeight.normal,
        double fontSize = 18,
        Color fontColor = Colors.black38,
        bool italic = false,
      }): super.rich(
      text,
      key: key,
      style: TextStyle(
        decoration: TextDecoration.none,
        color: fontColor,
        fontFamily: 'Roboto',
        fontWeight: fontWeight,
        fontStyle: italic ? FontStyle.italic : FontStyle.normal,
        fontSize: fontSize,
      ));

}