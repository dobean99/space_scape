import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:space_scape/game/space_scape.dart';
import 'package:space_scape/screens/overlays/pause_menu.dart';
import 'package:space_scape/utils/buttons/pause_button.dart';

class GamePlay extends StatelessWidget {
  GamePlay({Key? key}) : super(key: key);
  final SpaceScape spaceScape = SpaceScape();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WillPopScope(
          onWillPop: () async => false,
          child: GameWidget(
            game: spaceScape,
            initialActiveOverlays: const [PauseButton.id],
            overlayBuilderMap: {
              PauseButton.id: (BuildContext context, SpaceScape gameRef) =>
                  PauseButton(gameRef: gameRef),
              PauseMenu.id: (BuildContext context, SpaceScape gameRef) =>
                  PauseMenu(gameRef: gameRef),
            },
          ),
        ),
      ),
    );
  }
}
