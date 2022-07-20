import 'package:flutter/material.dart';
import 'package:space_scape/screens/main_menu.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MaterialApp(
    theme:ThemeData(
      fontFamily:"BungeeInline",
      scaffoldBackgroundColor: Colors.black
    ),
      home: const MainMenu()));
}
