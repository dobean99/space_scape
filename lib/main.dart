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
  WidgetsFlutterBinding.ensureInitialized();
  final game = SpaceScape();
  runApp(GameWidget(game: game));
}

class SpaceScape extends FlameGame
    with HasDraggables, HasCollisionDetection, HasTappables {
  late SpriteSheet spriteSheet;
  late Player player;
  late Enemy enemy;
  late EnemyManager enemyManager;
  late Bullet bullet;

  // Offset? _pointerStartPosition;
  // Offset? _pointerCurrentPosition;
  // final double _joyStickRadius = 60;
  // final double _deadZoneRadius = 10;

  late JoystickComponent joystick;

  @override
  Future<void>? onLoad() async {
    //add assets
    await images.load('simpleSpace_tilesheet@2.png');
    spriteSheet = SpriteSheet.fromColumnsAndRows(
        image: images.fromCache('simpleSpace_tilesheet@2.png'),
        columns: 8,
        rows: 6);

    //add joystick
    joystick = JoystickComponent(
      anchor: Anchor.bottomLeft,
      position: Vector2(30, size.y - 30),
      size: 100,
      background: CircleComponent(
        radius: 60,
        paint: Paint()..color = Colors.white.withOpacity(0.5),
      ),
      knob: CircleComponent(radius: 25),
    );
    add(joystick);

    //add space ship
    player = Player(
      joystick: joystick,
      sprite: spriteSheet.getSpriteById(7),
      size: Vector2(64, 64),
      position: size / 2,
      spriteSheet: spriteSheet,
    );
    player.anchor = Anchor.center;
    add(player);

    //add button attack
    final button = ButtonComponent(
      button: CircleComponent(
        radius: 30,
        paint: Paint()..color = Colors.white.withOpacity(0.5),
      ),
      anchor: Anchor.bottomRight,
      position: Vector2(size.x - 30, size.y - 60),
      onPressed: joystickAction,
    );
    add(button);

    //add enemy
    enemyManager = EnemyManager(spriteSheet: spriteSheet);
    add(enemyManager);

    return super.onLoad();
  }
  void joystickAction() {
    final bullet = Bullet(
      size: Vector2(32, 32),
      position: player.position,
      spriteSheet: spriteSheet,
    );
    bullet.anchor = Anchor.center;

    add(bullet);
  }
  ///code not use CollisionCallbacks
/* @override
  void update(double dt) {
    final bullets = children.whereType<Bullet>();
    final enemies = children.whereType<Enemy>();
    for (final enemy in enemies) {
      for (final bullet in bullets) {
        if (enemy.containsPoint(bullet.absoluteCenter)) {
          enemy.removeFromParent();
          bullet.removeFromParent();
          break;
        }
      }
      if (player.containsPoint(enemy.absoluteCenter)) {
        debugPrint("Enemy killed player");
      }
    }
    super.update(dt);
  }

 // add tap to attack
  @override
  void onTapDown(TapDownInfo info) {
    bullet = Bullet(
      size: Vector2(64, 64),
      position: player.position.clone(),
      spriteSheet: spriteSheet,
    );
    bullet.anchor = Anchor.center;
    add(bullet);
    super.onTapDown(info);
  }
  // render joystick
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
  }*/

  /// code not use HasDraggable
/* @override
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
  }*/
}
