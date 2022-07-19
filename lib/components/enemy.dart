import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:space_scape/components/bullet.dart';

class Enemy extends SpriteComponent with HasGameRef,CollisionCallbacks {
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
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Bullet) {
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
