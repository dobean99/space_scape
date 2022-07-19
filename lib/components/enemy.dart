import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Enemy extends SpriteComponent with HasGameRef {
  final double _speed = 200;
  late Vector2 gameSize;

  Enemy({
    Vector2? position,
    Vector2? size,
    Sprite? sprite,
  }) : super(position: position, size: size, sprite: sprite);

  @override
  Future<void>? onLoad() {
    gameSize = gameRef.size;
    return super.onLoad();
  }

  @override
  void update(double dt) {
    position += Vector2(0, 1) * _speed * dt;
    if (position.y > gameSize.y) {
      removeFromParent();
    }
    super.update(dt);
  }

  @override
  void onRemove() {
    super.onRemove();
  }
}
