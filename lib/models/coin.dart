import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame_game/game/cors_game.dart';
import 'package:flame_game/models/ship.dart';
import 'package:flame_svg/flame_svg.dart';
import 'dart:math' as math; 

class Coin extends SvgComponent with CollisionCallbacks,HasGameRef<CorsGame> {
  double speed=100;
  double? radian;
  Svg? svgImage;
  Coin({this.svgImage,Vector2? position,Vector2? size,this.radian}):super(svg: svgImage,size: size,position:position,anchor: Anchor.center,
      );
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
  // @override
  // void update(double dt) {
  //   super.update(dt);
  //   position+=Vector2(0,-1)*speed*dt;
  // }
  
  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if(other is Ship){
      final effectController = EffectController(
        duration: 0.75,
        
      );
      add(OpacityEffect.fadeOut(effectController,onComplete: () =>removeFromParent(),));
       
    }
  } 
}