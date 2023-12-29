import 'package:flutter/material.dart';
import 'package:submission_idcamp/activity/main/view/main_view.dart';
import 'package:submission_idcamp/components/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      home: const MainView(),
    );
  }
}
