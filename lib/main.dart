import 'package:flutter/material.dart';
import 'package:space_scape/screens/main_menu.dart';
import 'package:flame/flame.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  runApp( MaterialApp(
    theme:ThemeData(
      fontFamily:"BungeeInline",
      scaffoldBackgroundColor: Colors.black
    ),
      home: const MainMenu()));
}
