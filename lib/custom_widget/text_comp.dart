import 'package:flutter/material.dart';

class TextUzs extends Text {
  TextUzs(super.data);
  
  @override
  // TODO: implement data
  String? get data => "${super.data} UZS";

}