import 'package:flutter/material.dart';

Widget bottomBackgroungImage(){
  return Positioned(
    bottom: 32,
    left: 4,
    child: Image.asset(
      'assets/img/bottom_background_image.png',
      height: 30.75,
    ),
  );
}