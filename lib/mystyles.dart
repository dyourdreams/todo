import 'package:flutter/material.dart';

Color primary = Colors.orange.shade200;
class Style{
  static Color primaryColor = primary;
  static Color textColor = const Color(0xFF3b3b3b);
  static Color bgColor = Colors.orange.shade300;

  static TextStyle textStyle = TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.grey[700]);
  static TextStyle headLineStyle1 = TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.grey[700]);
  static TextStyle headLineStyle2 = const TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.red,decoration: TextDecoration.lineThrough);
}