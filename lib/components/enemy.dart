import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:space_scape/components/bullet.dart';
import 'package:space_scape/components/player.dart';
import 'package:space_scape/game/space_scape.dart';

class Enemy extends SpriteComponent
    with HasGameRef<SpaceScape>, CollisionCallbacks {
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
  void onMount() {
    final shape = CircleHitbox();
    add(shape);
    super.onMount();
  }

  @override
  void render(Canvas canvas) {
    renderDebugMode(canvas);
    super.render(canvas);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Bullet||other is Player) {
      gameRef.player.score += 1;
      removeFromParent();
    }
    super.onCollision(intersectionPoints, other);
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
