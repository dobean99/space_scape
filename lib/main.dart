import 'package:flutter/material.dart';
import 'package:space_scape/screens/main_menu.dart';
import 'package:flame/flame.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Flame.device.fullScreen();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "BungeeInline",
        primaryColor: Colors.white,
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.white),
          subtitle1: TextStyle(color: Colors.white),
        ),
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const MainMenu()));
}
