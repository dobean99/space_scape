import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:space_scape/components/bullet.dart';
import 'package:space_scape/components/enemy.dart';
import 'package:space_scape/components/enemy_manager.dart';
import 'package:space_scape/components/player.dart';

void main() {
  final game = SpaceScape();
  runApp(GameWidget(game: game));
}

class SpaceScape extends FlameGame with PanDetector, TapDetector,HasCollisionDetection{
  Offset? _pointerStartPosition;
  Offset? _pointerCurrentPosition;
  late SpriteSheet spriteSheet;
  late Player player;
  late Enemy enemy;
  late EnemyManager enemyManager;
  late Bullet bullet;
  final double _joyStickRadius = 60;
  final double _deadZoneRadius = 10;

  @override
  Future<void>? onLoad() async {
    await images.load('simpleSpace_tilesheet@2.png');
    spriteSheet = SpriteSheet.fromColumnsAndRows(
        image: images.fromCache('simpleSpace_tilesheet@2.png'),
        columns: 8,
        rows: 6);
    player = Player(
        sprite: spriteSheet.getSpriteById(7),
        size: Vector2(64, 64),
        position: size / 2);
    player.anchor = Anchor.center;
    add(player);
    enemyManager = EnemyManager(spriteSheet: spriteSheet);
    add(enemyManager);

    return super.onLoad();
  }

  @override
  void update(double dt) {
    final bullets = children.whereType<Bullet>();
    final enemies= children.whereType<Enemy>();
    for (final enemy in enemies) {
      for (final bullet in bullets) {
        if (enemy.containsPoint(bullet.absoluteCenter)) {
          enemy.removeFromParent();
          bullet.removeFromParent();
          break;
        }
      }
      if( player.containsPoint(enemy.absoluteCenter)){
        debugPrint("Enemy killed player");
      }
    }
    super.update(dt);
  }

  @override
  void onTapDown(TapDownInfo info) {
    bullet = Bullet(
      size: Vector2(64, 64),
      position: player.position,
      spriteSheet: spriteSheet,
    );
    bullet.anchor = Anchor.center;
    add(bullet);
    super.onTapDown(info);
  }

  @override
  void render(Canvas canvas) {
    if (_pointerStartPosition != null) {
      canvas.drawCircle(_pointerStartPosition!, 60,
          Paint()..color = Colors.grey.withAlpha(100));
    }
    if (_pointerCurrentPosition != null) {
      Offset delta = _pointerCurrentPosition! - _pointerStartPosition!;
      if (delta.distance > _joyStickRadius) {
        delta = _pointerStartPosition! +
            (Vector2(delta.dx, delta.dy).normalized() * _joyStickRadius)
                .toOffset();
      } else {
        delta = _pointerCurrentPosition!;
      }
      canvas.drawCircle(
          delta, 20, Paint()..color = Colors.white.withAlpha(100));
    }
    super.render(canvas);
  }

  @override
  void onPanDown(DragDownInfo info) {}

  @override
  void onPanStart(DragStartInfo info) {
    _pointerStartPosition = info.raw.globalPosition;
    _pointerCurrentPosition = info.raw.globalPosition;
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    _pointerCurrentPosition = info.raw.globalPosition;
    Offset delta = _pointerCurrentPosition! - _pointerStartPosition!;
    if (delta.distance > _deadZoneRadius) {
      player.setMoveDirection(Vector2(delta.dx, delta.dy));
    } else {
      player.setMoveDirection(Vector2.zero());
    }
  }

  @override
  void onPanEnd(DragEndInfo info) {
    _pointerStartPosition = null;
    _pointerCurrentPosition = null;
    player.setMoveDirection(Vector2.zero());
  }

  @override
  void onPanCancel() {
    _pointerStartPosition = null;
    _pointerCurrentPosition = null;
  }
}
