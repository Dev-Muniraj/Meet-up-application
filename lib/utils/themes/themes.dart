import 'package:flutter/material.dart';
import 'package:flutter_task_1/utils/themes/custom_widget_theme/check_box_theme.dart';
import 'custom_widget_theme/text_theme.dart';

final ThemeData themeData = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  textTheme: customTextTheme,
  checkboxTheme: customCheckboxThemeData,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.blue,
);
