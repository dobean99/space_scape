import 'package:flutter/material.dart';

class AppColors {

  static const Color primaryColor = Color.fromRGBO(22, 83, 165, 1);
  static const Color backgroundColor =Color(0xFF01b4e4);
  static const Color lightTextColor = Color.fromRGBO(122, 134, 154, 1);

  static const  LinearGradient linearGradient =  LinearGradient(
    colors: <Color>[
      primaryColor,
      backgroundColor,
    ],
  );

}