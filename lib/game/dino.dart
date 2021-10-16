import 'dart:ui';

import 'package:flame/components/animation_component.dart';
import 'package:flame/spritesheet.dart';
import 'package:flutter/material.dart';

const double groundheight = 32;
const double dinoTopBottomSpacing = 10;
const double GRAVITY = 1000;

class Dino extends AnimationComponent{

  double speedY = 0.0;
  double speedX = 0.0;
  double yMax = 0.0;
  double xMax = 0.0;

  Dino() : super.empty(){

    final spritesSheet =
    SpriteSheet(imageName: 'DinoSprites - tard.png', textureWidth: 24, textureHeight: 24, columns: 24, rows: 1);

    // final idleAnim = spritesSheet.createAnimation(0, from: 0, to: 3, stepTime: 0.1);
    final runAnim = spritesSheet.createAnimation(0, from: 4, to: 10, stepTime: 0.1);

    this.animation = runAnim;

  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override
  void update(double t) {
    super.update(t);

    // print('UPDATEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE');

    speedY += GRAVITY * t;

    y += this.speedY * t;

    if(isJump){
      speedX += 10 * t;
      x += this.speedX * t;
    }

    print('Update=========  ${speedY} --------------   ${y}----------------------- ${t}');

    // x += speedX * t;

    // print('AFTER=========  ${speedY} --------------   ${y}');

    if(isOnGround()){
      y = yMax;
      speedY = 0.0;
      isJump = false;

    }

  }


  bool isOnGround(){
    return y >= yMax;
  }

  @override
  void resize(Size size) {
    super.resize(size);


    this.height = this.width = size.width / 10;
    this.x = this.width;
    this.y = size.height - groundheight - this.height + dinoTopBottomSpacing;

    xMax = this.width;
    this.yMax = this.y;

    print('RESIZEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE     ${x} =====   ${y} ====   ${size.height}');


  }
bool isJump = false;
  void jump() {
    if(isOnGround()){
      isJump = true;
      this.speedY = -300;
      this.speedX = 100;
    }
  }

}