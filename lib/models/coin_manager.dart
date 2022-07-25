
import 'package:flame/components.dart';
import 'package:flame_game/game/cors_game.dart';
import 'package:flame_game/models/coin.dart';
import 'package:flame_game/util.dart';
import 'package:flame_svg/flame_svg.dart';
import 'dart:math' as math; 
class CoinManager extends Component with HasGameRef<CorsGame> {
  Svg? coinImg;
  int coinsCount=30;
  CoinManager({this.coinImg}); 
  @override
  void onMount() {
    super.onMount();
    for(var i = 1; i < coinsCount; i+=1) {
      double deg = ((360/coinsCount)*i)-90;
       print(deg);
      double radian = Util.radians(deg);
      double x= 160 * math.cos(radian);
       double y = 160 * math.sin(radian);
      if (deg != 360) {
        Coin coin = Coin(svgImage: coinImg,size: Vector2(20,20),position: Vector2((gameRef.size.x/2)+x,(gameRef.size.x/2)+y));
        add(coin);
      }
    } 
  }  
}