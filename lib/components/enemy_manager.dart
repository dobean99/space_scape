import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/sprite.dart';

import 'enemy.dart';

class EnemyManager extends Component with HasGameRef {
  late Timer timer;
  SpriteSheet spriteSheet;
  Random random = Random();
  late Vector2 gameSize;

  EnemyManager({required this.spriteSheet}) : super() {
    timer = Timer(1, onTick: _spawnEnemy, repeat: true);
  }

  @override
  Future<void>? onLoad() {
    gameSize = gameRef.size;
    return super.onLoad();
  }

  void _spawnEnemy() {
    Vector2 position = Vector2(random.nextDouble() * gameSize.x, 0);
    Vector2 initial = Vector2(64, 64);
    position.clamp(Vector2.zero()  , gameSize - initial);
    Enemy enemy = Enemy(
        sprite: spriteSheet.getSpriteById(17),
        size: initial,
        position: position);
    gameRef.add(enemy);
  }

  @override
  void onMount() {
    timer.start();
    super.onMount();
  }
  @override

  @override
  void update(double dt) {
    timer.update(dt);
    super.update(dt);
  }

  @override
  void onRemove() {
    timer.stop();
    super.onRemove();
  }
}
