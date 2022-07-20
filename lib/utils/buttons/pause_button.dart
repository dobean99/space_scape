import 'package:flutter/material.dart';
import 'package:space_scape/game/space_scape.dart';
import 'package:space_scape/screens/overlays/pause_menu.dart';

class PauseButton extends StatelessWidget {
  const PauseButton({Key? key, required this.gameRef}) : super(key: key);
  static const String id = 'PauseButton';
  final SpaceScape gameRef;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: IconButton(
        icon: const Icon(
          Icons.pause,
          color: Colors.white,
        ),
        onPressed: () {
          gameRef.pauseEngine();
          gameRef.overlays.add(PauseMenu.id);
          gameRef.overlays.remove(PauseButton.id);
        },
      ),
    );
  }
}
