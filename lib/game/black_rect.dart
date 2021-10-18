import 'dart:math';
import 'dart:ui';
import 'package:flame/components/animation_component.dart';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flame/spritesheet.dart';
import 'package:flutter/material.dart';

class BlackRect {
  Size _size;

  BlackRect(){
    var player = SpriteComponent.square(64, 'rect_green');
  }

  void update(double t) {
    // super.update(t);
  }

  void render(Canvas canvas) {
    // super.render(canvas);

// canvas.drawRect(Rect.fromLTWH(0, 0, 100, 100), Paint()..color = Colors.green);
  }

  void resize(Size size) {
    _size = size;

    // this.height = this.width = size.width / 10;
    // this.x = this.width;
    // this.y = size.height / 2 /*- groundheight - this.height + dinoTopBottomSpacing*/;
  }
}
