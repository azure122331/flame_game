
import 'package:flame/components.dart';
import 'package:flame_game/game/cors_game.dart';
import 'package:flame_game/models/bullet.dart'; 
import 'package:flame_svg/flame_svg.dart';
class BulletManager extends Component with HasGameRef<CorsGame> {
  late Timer timer;
  Svg? bulletImg;
  BulletManager({this.bulletImg}){
    timer=Timer(0.4, onTick: _spawnEnemy, repeat: true);
  }
  void _spawnEnemy() {  
    if (gameRef.buildContext != null) {
       Bullet c = Bullet(svgImage: bulletImg,size: Vector2(12,36),position: Vector2(gameRef.size.x/2,gameRef.size.y-50));
      add(c);
    }
  }
  @override
  void onMount() {
    super.onMount(); 
    timer.start();
  }

  @override
  void onRemove() {
    super.onRemove(); 
    timer.stop();
  }

  @override
  void update(double dt) {
    super.update(dt); 
    timer.update(dt);
     
  }
 
}