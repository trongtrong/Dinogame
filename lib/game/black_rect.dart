import 'dart:math';
import 'dart:ui';
import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/has_game_ref.dart';
import 'package:flutter/material.dart';
import 'package:test_game/game/game.dart';

class BlackRect extends Component with HasGameRef<DinoGame>{
  Size _size;
  Random _random;

  BlackRect();

  @override
  void render(Canvas canvas) {
    print('BlackRect======${_size.width}');

    canvas.drawRect(Rect.fromLTWH(_size.width/10, _size.height/2 + 24 + 10, _size.width / 10, _size.height/2), Paint()..color = Colors.green);
  }

  @override
  void update(double t) {
  }

  @override
  void resize(Size size) {
    super.resize(size);

    _size = size;

  }

}