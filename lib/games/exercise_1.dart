import 'dart:math';

import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flare_primeiro_exemplo/components/square_component.dart';

/*

  Criar formas aleatórias, em posições aleatórias e com velocidades aleatórias.

  - Quando o usuário clicar na tela, criar a forma;
  - Limitar a posição inicial;

*/

class Exercise1 extends FlameGame with DoubleTapDetector, TapDetector {
  bool running = true;

  double _generateRandom(double limit) {
    Random vrRandom = Random();

    return vrRandom.nextDouble() * limit;
  }

  Vector2 _generateRandomPosition(Point prPoint) {
    Random vrRandom = new Random();

    return Vector2(vrRandom.nextInt(prPoint.x.toInt()).toDouble(),
        vrRandom.nextInt(prPoint.y.toInt()).toDouble());
  }

  @override
  void onTapUp(TapUpInfo info) {
    Vector2 vrPosition =
        this._generateRandomPosition(Point(this.size.x, this.size.y));

    print("onTapUp");
    print(vrPosition);

    add(SquareComponent()
      ..position = vrPosition
      ..squareSize = _generateRandom(50)
      ..velocity = Vector2(0, 1).normalized() * _generateRandom(30)
      ..color = (BasicPalette.red.paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2));
  }

  @override
  void onDoubleTap() {
    if (this.running) {
      pauseEngine();
    } else {
      resumeEngine();
    }

    this.running = !this.running;
  }
}
