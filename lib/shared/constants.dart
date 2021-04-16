import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue, width: 2.0)
  ),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 2.0)
  ),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue, width: 2.0)
  ),
);

const textInputDecorationDetails = InputDecoration(
  contentPadding: EdgeInsets.all(10.0),
  isDense: true,
  fillColor: Color(0xFFFAFAFA),
  filled: true,
  border: OutlineInputBorder(
    borderSide: BorderSide(width: 2.0)
  ),
//  enabledBorder: OutlineInputBorder(
//      borderSide: BorderSide(color: Colors.blue, width: 1.0)
//  ),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue, width: 2.0)
  ),
);