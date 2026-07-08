import 'package:flutter/material.dart';

import 'ui/screens/main_page.dart';
import 'ui/theme/app_theme.dart';

void main() {
  runApp(const StudentIdentityApp());
}

class StudentIdentityApp extends StatelessWidget {
  const StudentIdentityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Identity',
      theme: AppTheme.lightTheme,
      home: const MainPage(),
    );
  }
}