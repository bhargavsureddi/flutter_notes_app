import 'package:flutter/material.dart';

const Color kcolor = Colors.lightBlueAccent;

final BoxDecoration kNoteTileBoxDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(12.0),
  color: Color(0xff242424),
  boxShadow: [
    BoxShadow(blurRadius: 2.0, spreadRadius: 1.0, color: Color(0xff848484))
  ],
);

const TextStyle kNoteTileTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 15.0,
  fontWeight: FontWeight.w400,
);

const TextStyle kTitleTextField = TextStyle(
  color: Colors.white,
  fontSize: 28.0,
  fontWeight: FontWeight.w400,
);

const InputBorder kBlackBorder =
    OutlineInputBorder(borderSide: BorderSide(color: Colors.black));

InputDecoration kTextFieldNewNote = InputDecoration(
  border: kBlackBorder,
  focusedBorder: kBlackBorder,
  hintText: "Title",
  hintStyle: TextStyle(
    color: Colors.grey.shade700,
    fontWeight: FontWeight.w500,
    fontSize: 32,
  ),
);
