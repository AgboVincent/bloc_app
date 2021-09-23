import 'package:flutter/material.dart';

var textInputDecoration =InputDecoration(
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide( color: Colors.grey, width:1.0),
      borderRadius: BorderRadius.circular(5)
  ),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide( color: Colors.grey, width:1.0 ),
      borderRadius: BorderRadius.circular(5)
  ),
  errorBorder: OutlineInputBorder(
      borderSide: BorderSide( color:Colors.grey, width:1.0),
      borderRadius: BorderRadius.circular(5)
  ),
  focusedErrorBorder: new OutlineInputBorder(
      borderSide: new BorderSide(color: Colors.grey, width: 1.0),
      borderRadius: BorderRadius.circular(5)
  ),
  errorStyle: TextStyle(
      fontSize: 15
  ),
);