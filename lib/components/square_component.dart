import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

class SquareComponent extends PositionComponent {
  Vector2 velocity = Vector2(0, 0).normalized() * 2;

  double squareSize = 128.0;

  Paint color = BasicPalette.white.paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;

  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    size.setValues(squareSize, squareSize);

    anchor = Anchor.center;
  }

  @override
  void update(double dt) {
    super.update(dt);

    position += velocity * dt;
  }

  @override
  void render(Canvas canvas) {
    // TODO: implement render
    super.render(canvas);

    canvas.drawRect(size.toRect(), color);
  }
}
