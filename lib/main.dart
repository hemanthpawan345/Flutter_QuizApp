import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:myapp_2/app/theme/theme.dart';
import 'package:myapp_2/app/modules/home/quiz.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme:AppThemes.blueTheme,
      themeMode: ThemeMode.light,
      home: const Quiz(),
    );
  }
}
