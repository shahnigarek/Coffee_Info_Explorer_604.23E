import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(CoffeeInfoExplorerApp());
}

class CoffeeInfoExplorerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Info Explorer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1E1B18),
        primaryColor: const Color(0xFF6F4E37),
        cardColor: const Color(0xFF3E2F27),
        textTheme: ThemeData.dark().textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white70,
        ),
      ),
      home: HomePage(),
    );
  }
}
