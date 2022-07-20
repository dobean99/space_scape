import 'package:flutter/material.dart';
import 'package:space_scape/game/space_scape.dart';
import 'package:space_scape/utils/buttons/button_gradient.dart';
import 'package:space_scape/utils/buttons/pause_button.dart';
import 'package:space_scape/utils/texts/text_title.dart';

class PauseMenu extends StatelessWidget {
  const PauseMenu({Key? key, required this.gameRef}) : super(key: key);
  final SpaceScape gameRef;
  static const String id = 'PauseMenu';

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextTitle(
              title: "Pause",
            ),
            ButtonGradient(
              text: 'Resume',
              onPressed: () {
               gameRef.resumeEngine();
               gameRef.overlays.remove(PauseMenu.id);
               gameRef.overlays.add(PauseButton.id);
              },
            ),
            ButtonGradient(
              text: 'Options',
              onPressed: () {},
            ),
          ],
        ),
    );
  }
}
