import 'package:flame/game.dart';
import 'package:flame_game/game/cors_game.dart'; 
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({ Key? key }) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(width: double.infinity,height: double.infinity,child: GameWidget(
      game: CorsGame(),
    ),),
    );
  }
}