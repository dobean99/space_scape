import 'package:flutter/material.dart';
import 'package:space_scape/game/game_play.dart';
import 'package:space_scape/utils/buttons/button_gradient.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Space Scape",
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
              ),
            ),
            ButtonGradient(
              text: 'Play',
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => GamePlay()));
              },
            ),
            ButtonGradient(
              text:  'Options',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

