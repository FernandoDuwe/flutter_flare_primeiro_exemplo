import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flare_primeiro_exemplo/components/square_component.dart';
import 'package:flutter_flare_primeiro_exemplo/games/exercise_1.dart';
import 'package:flutter_flare_primeiro_exemplo/games/first_example.dart';

void main() {
  runApp(GameWidget(game: Exercise1()));
}
