import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flare_primeiro_exemplo/components/square_component.dart';

void main() {
  runApp(GameWidget(game: PrimeiroExemplo()));
}

class PrimeiroExemplo extends FlameGame with DoubleTapDetector, TapDetector {
  bool running = true;

  @override
  void onTapUp(TapUpInfo info) {
    Vector2 touchPoint = info.eventPosition.global;

    final handled = children.any((element) {
      if ((element is SquareComponent) && (element.containsPoint(touchPoint))) {
        element.velocity.negate();

        return true;
      }

      return false;
    });

    if (!handled) {
      add(SquareComponent()
        ..position = touchPoint
        ..squareSize = 45.0
        ..velocity = Vector2(0, 1).normalized() * 25
        ..color = (BasicPalette.red.paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2));
    }
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
