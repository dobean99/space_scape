import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:space_scape/game/space_scape.dart';

class GamePlay extends StatelessWidget {
  GamePlay({Key? key}) : super(key: key);
  final SpaceScape spaceScape = SpaceScape();

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: spaceScape);
  }
}
