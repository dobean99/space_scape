import 'package:flame/components.dart';

mixin KnowsGameSize on Component {
  late Vector2 gameSize;

  onSize(Vector2 newGameSize) {
    gameSize = newGameSize;
  }
}
