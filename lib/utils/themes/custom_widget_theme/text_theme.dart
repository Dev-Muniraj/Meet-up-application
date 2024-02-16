import 'package:flutter/material.dart';

 TextTheme customTextTheme = TextTheme(

  headlineLarge:const TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
  headlineMedium:const TextStyle(fontSize: 26.0, fontWeight: FontWeight.w800),
  headlineSmall:const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),

  titleLarge: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, color: Colors.black),
  titleMedium: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black),
  titleSmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black.withOpacity(0.5)),


  bodyLarge:  TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500, color: Colors.black.withOpacity(0.7)),
  bodyMedium: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.black),
  bodySmall: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300, color: Colors.black.withOpacity(0.5)),


  labelLarge: const TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
  labelMedium: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600,),
  labelSmall: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.w400,),

);