import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:space_scape/components/enemy.dart';
import 'package:space_scape/game/space_scape.dart';

class Player extends SpriteComponent
    with HasGameRef<SpaceScape>, CollisionCallbacks {
  //Vector2 _moveDirection = Vector2.zero();
  final double _speed = 300;
  int score = 0;
  int health = 100;
  late Vector2 gameSize;
  JoystickComponent joystick;
  final SpriteSheet spriteSheet;

  Player({
    required this.spriteSheet,
    required this.joystick,
    Vector2? position,
    Vector2? size,
    Sprite? sprite,
  }) : super(
            position: position,
            size: size,
            sprite: spriteSheet.getSpriteById(7));

  @override
  Future<void>? onLoad() {
    // add(MoveEffect.by(Vector2(0,-10 ), EffectController(
    //   alternate: true,
    //   infinite: true,
    //   duration: 1,
    //   curve: Curves.ease,
    // )));
    add(ColorEffect(
      const Color(0xFFd31d1d),
      const Offset(0.0, 0.8),
      EffectController(duration: 1.5),
    ));

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
  void render(Canvas canvas) {
    //renderDebugMode(canvas);
    super.render(canvas);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Enemy) {
      health -= 10;
      if (health < 0) {
        health = 0;
      }
    }
    super.onCollision(intersectionPoints, other);
  }

  @override
  void update(double dt) {
    //position += _moveDirection.normalized() * _speed * dt;
    if (!joystick.delta.isZero()) {
      position.add(joystick.relativeDelta * _speed * dt);
    }
    position.clamp(Vector2.zero() + size / 2, gameSize - size / 2);

    super.update(dt);
  }

  void reset() {
    score = 0;
    health = 100;
    position = gameSize / 2;
  }

// void setMoveDirection(Vector2 newDirection) {
//   _moveDirection = newDirection;
// }
}
