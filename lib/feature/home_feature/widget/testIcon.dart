import 'package:flutter/material.dart';

Widget testIconWidget(Color color,String path){
  return Container(
      padding: const EdgeInsets.all(16),
      width: 56,
      height: 56,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color),
      child: Image.asset(path));
}