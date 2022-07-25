import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_game/models/bullet_manager.dart';
import 'package:flame_game/models/coin.dart';
import 'package:flame_game/models/coin_manager.dart';
import 'package:flame_game/models/ship.dart';
import 'package:flame_svg/flame_svg.dart';

class CorsGame extends FlameGame with HasCollisionDetection{
  Svg? shipSvg;
  Svg? coinSvg;
  Svg? bulletSvg;
    @override
  Future<void> onLoad() async {
    shipSvg=await loadSvg('images/ship.svg');
    coinSvg=await loadSvg('images/coin.svg');
    bulletSvg=await loadSvg('images/bullet.svg');
    Ship ship=Ship(
      svgImage: shipSvg,size: Vector2(50,50),
      position: Vector2(canvasSize.x/2,50), 
    );
    // BulletManager bulletManager=BulletManager(
    //   bulletImg: bulletSvg 
    // );
    // add(bulletManager);
    CoinManager coinManager=CoinManager(
      coinImg: coinSvg 
    );
    add(coinManager);
    add(ship);
    
  }

}