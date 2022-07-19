import 'package:flame/components.dart';
import 'package:flame/sprite.dart';

class Bullet extends SpriteComponent {
  final double _speed = 400;
  final SpriteSheet spriteSheet;

  Bullet({
    required this.spriteSheet,
    Vector2? position,
    Vector2? size,
    Sprite? sprite,
  }) : super(
            position: position,
            size: size,
            sprite: spriteSheet.getSpriteById(28));

  @override
  void update(double dt) {
    position += Vector2(0, -1) * _speed * dt;
    super.update(dt);
  }
}
