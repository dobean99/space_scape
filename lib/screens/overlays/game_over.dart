import 'package:flutter/material.dart';
import 'package:space_scape/game/space_scape.dart';
import 'package:space_scape/screens/main_menu.dart';
import 'package:space_scape/utils/buttons/button_gradient.dart';
import 'package:space_scape/utils/buttons/pause_button.dart';
import 'package:space_scape/utils/texts/text_title.dart';

class GameOverMenu extends StatelessWidget {
  const GameOverMenu({Key? key, required this.gameRef}) : super(key: key);
  final SpaceScape gameRef;
  static const String id = 'GameOver';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextTitle(
            title: "GameOver",
          ),
          ButtonGradient(
            text: 'Restart',
            onPressed: () {
              gameRef.overlays.remove(GameOverMenu.id);
              gameRef.overlays.add(PauseButton.id);
              gameRef.reset();
              gameRef.resumeEngine();
            },
          ),
          ButtonGradient(
            text: 'Exit',
            onPressed: () {
              gameRef.overlays.remove(GameOverMenu.id);
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const MainMenu()));
            },
          ),
        ],
      ),
    );
  }
}
