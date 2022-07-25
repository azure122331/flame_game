import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_game/game/cors_game.dart';
import 'package:flame_game/models/ship.dart';
import 'package:flame_svg/flame_svg.dart';
import 'dart:math' as math; 

class Bullet extends SvgComponent with CollisionCallbacks,HasGameRef<CorsGame> {
  double speed=100;
  Svg? svgImage;
  Bullet({this.svgImage,Vector2? position,Vector2? size}):super(svg: svgImage,size: size,position:position,anchor: Anchor.center,
      angle: 0,);
  @override
  void onMount() {
    super.onMount();
    final shape = CircleHitbox.relative(
      0.8,
      parentSize: size,
      position: size / 2,
      anchor: Anchor.center,
    );
    add(shape);
  }
  @override
  void update(double dt) {
    super.update(dt);
    position+=Vector2(0,-1)*speed*dt;
  }
  
  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if(other is Ship){
      print('OnClick Ship');
    }
  } 
}