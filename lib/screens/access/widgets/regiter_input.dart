/// Language package
import 'dart:ui';
/// Internal package
import 'package:flutter/material.dart';

/// Register 
class RegisterInput extends StatelessWidget {

  /// Attributes 
  final String hintText;
  final TextEditingController controller;

  /// Constructor
  RegisterInput(this.hintText, { Key key, this.controller }): super(key: key);

  @override
  /// Build widget
  Widget build(BuildContext context) {

    // Dimensions
    final double width = MediaQuery.of(context).size.width * 0.75;
    final double marginWidth =  (MediaQuery.of(context).size.width - width) / 2;
    final double height = 40;

    // Return widget
    return Container(
      // Dimensions
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(horizontal: marginWidth, vertical: 10),

      // Container style
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(height/2),
        border: Border.all(color: Color(0xffc6c6c6), width: 1),
      ),

      // Input data (text field)
      child: TextField(
        scrollPadding: EdgeInsets.all(0),
        keyboardType: TextInputType.number,
        textAlignVertical: TextAlignVertical.center, 
        decoration: InputDecoration(
          isDense: true,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          hintText: "Testing",
          hintStyle: TextStyle(
            fontSize: 15,
          ),
        ),
        style: TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }


}