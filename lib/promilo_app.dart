import 'package:flutter/material.dart';
import 'package:flutter_task_1/utils/themes/themes.dart';
import 'features/pages/sign_in_page/sign_in_page.dart';
class PromiloApp extends StatelessWidget {
  const PromiloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Promilo Application",
      themeMode: ThemeMode.system,
      theme: themeData,
      home: const SignInScreen(),
    );
  }
}
