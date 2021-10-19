import 'dart:ui';

import 'package:flame/components/animation_component.dart';
import 'package:flame/components/component.dart';
import 'package:flame/spritesheet.dart';
import 'package:flutter/material.dart';

const double groundheight = 32;
const double dinoTopBottomSpacing = 10;
const double GRAVITY_Y = 1000;
const double GRAVITY_X = 10;
const double maxTime = 1500;

class Dino extends AnimationComponent {
  double speedY = 0.0;
  double speedX = 0.0;
  double yMax = 0.0;
  double xMax = 0.0;

  bool isJump = false;
  int startTime = 0;
  int timeDelta = 0;
  double distanceTarget = 0;

  Size _size;
  SpriteSheet spriteSheet;
  dynamic runAnim;
  dynamic hitAnim;

  Dino() : super.empty() {
    spriteSheet =
        SpriteSheet(imageName: 'DinoSprites - tard.png', textureWidth: 24, textureHeight: 24, columns: 24, rows: 1);

    runAnim = spriteSheet.createAnimation(0, from: 4, to: 10, stepTime: 0.1);
    hitAnim = spriteSheet.createAnimation(0, from: 11, to: 18, stepTime: 0.1);

    this.animation = runAnim;
  }

  void hit() {
    // final hitAnim = spriteSheet.createAnimation(0, from: 11, to: 18, stepTime: 0.1);
    this.animation = hitAnim;
  }

  void run() {
    // final runAnim = spriteSheet.createAnimation(0, from: 4, to: 10, stepTime: 0.1);
    this.animation = runAnim;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    // canvas.drawRect(Rect.fromLTWH(0, 0, 411, 761), Paint()..color = Colors.red);
  }

  @override
  void update(double t) {
    super.update(t);

    if (isJump) {
      speedY += GRAVITY_Y * t;
      y += this.speedY * t;

      x += distanceTarget * t;
    }

    if (isOnGround()) {
      y = yMax;
      speedY = 0.0;
      isJump = false;

      speedX = 0.0;
    }
  }

  bool isOnGround() {
    return y >= yMax;
  }

  @override
  void resize(Size size) {
    super.resize(size);
    _size = size;

    this.height = this.width = size.width / 10;
    this.x = this.width;
    this.y = size.height / 2 /*- groundheight - this.height + dinoTopBottomSpacing*/;

    xMax = this.width;
    this.yMax = this.y;
  }

  void jump() {
    if (isOnGround()) {
      isJump = true;
      this.speedY = -400;
    }
  }

  void drop() {
    this.speedY = -400;
  }

  //maxTime(milisecond) <=> jum over screen <=> screenSize.width
  //x(milisecond) =  y (length) >> y = x * screenSize.width / maxTime

  void onTapDown(TapDownDetails details) {
    startTime = DateTime.now().millisecondsSinceEpoch;
  }

  void onTapUp(TapUpDetails details) {
    int endTime = DateTime.now().millisecondsSinceEpoch;

    timeDelta = endTime - startTime;
    distanceTarget = ((_size.width - width) * timeDelta) / maxTime;

    jump();
  }
}
