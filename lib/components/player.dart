import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:space_scape/components/enemy.dart';

class Player extends SpriteComponent with HasGameRef, CollisionCallbacks {
  Vector2 _moveDirection = Vector2.zero();
  final double _speed = 300;
  late Vector2 gameSize;

  Player({
    Vector2? position,
    Vector2? size,
    Sprite? sprite,
  }) : super(position: position, size: size, sprite: sprite);

  @override
  Future<void>? onLoad() {
    gameSize = gameRef.size;
    debugPrint(gameSize.toString());

    return super.onLoad();
  }

  @override
  void onMount() {
    final shape = CircleHitbox();
    add(shape);
    super.onMount();
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Enemy) {
      debugPrint('Player hit enemy');
    }
    super.onCollision(intersectionPoints, other);
  }

  @override
  void update(double dt) {
    position += _moveDirection.normalized() * _speed * dt;
    position.clamp(Vector2.zero(), gameSize);
    super.update(dt);
  }

  void setMoveDirection(Vector2 newDirection) {
    _moveDirection = newDirection;
  }
}
