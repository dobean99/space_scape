import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:space_scape/components/enemy.dart';

class Bullet extends SpriteComponent with CollisionCallbacks {
  final double _speed = 400;
  final SpriteSheet spriteSheet;
  Vector2 direction = Vector2(0, -1);

  Bullet({
    required this.spriteSheet,
    Vector2? position,
    Vector2? size,
  }) : super(
            anchor: Anchor.center,
            position: position,
            size: size,
            sprite: spriteSheet.getSpriteById(28));

  @override
  void onMount() {
    final shape = CircleHitbox();
    add(shape);
    super.onMount();
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Enemy) {
      removeFromParent();
    }
    super.onCollision(intersectionPoints, other);
  }

  @override
  void render(Canvas canvas) {
    //renderDebugMode(canvas);
    super.render(canvas);
  }

  @override
  void update(double dt) {
    position += direction * _speed * dt;
    super.update(dt);
  }
}
