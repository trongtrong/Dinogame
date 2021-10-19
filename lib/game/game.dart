import 'dart:math';

import 'package:flame/components/animation_component.dart';
import 'package:flame/components/component.dart';
import 'package:flame/components/parallax_component.dart';
import 'package:flame/components/text_component.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/position.dart';
import 'package:flame/spritesheet.dart';
import 'package:flame/text_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_game/game/black_rect.dart';
import 'package:test_game/game/dino.dart';
import 'dart:math';

const widthRect = 50;
class DinoGame extends BaseGame with TapDetector {
  Dino _dino;
  BlackRect _blackRect;
  ParallaxComponent _parallaxComponent;
  TextComponent _scoreText;
  SpriteComponent _spriteCpnFirst;
  SpriteComponent _spriteCpnSecond;
  int score;
  Random _random;
  Size _size;
  double xMin = 0;

  DinoGame() {
    _random = Random();

    _parallaxComponent = ParallaxComponent([
      ParallaxImage('plx-1.png'),
      ParallaxImage('plx-2.png'),
      ParallaxImage('plx-3.png'),
      ParallaxImage('plx-4.png'),
      ParallaxImage('plx-5.png'),
      ParallaxImage('plx-6.png', fill: LayerFill.none),
    ], baseSpeed: Offset(40, 0));

    add(_parallaxComponent);

    _dino = Dino();
    add(_dino);

    // _blackRect = BlackRect();
    // add(_blackRect);

    _spriteCpnFirst = SpriteComponent.square(50, 'rect_green.png');
    add(_spriteCpnFirst);

    _spriteCpnSecond = SpriteComponent.square(50, 'rect_green.png');
    add(_spriteCpnSecond);

    score = 0;
    _scoreText = TextComponent(score.toString(), config: TextConfig(color: Colors.white, fontSize: 40));
    add(_scoreText);
  }

  @override
  void resize(Size size) {
    super.resize(size);

    _size = size;

    xMin = _size.width / 10;

    _scoreText.setByPosition(Position(size.width / 2 - _scoreText.width, 100));

    _spriteCpnFirst.x = size.width / 10;
    _spriteCpnFirst.y = size.height / 2 + size.width / 10 - 20;

    int randomX =
        (size.width / 10).toInt() + 50 + _random.nextInt(size.width.toInt() - 50 - (size.width / 10 + 50).toInt());
    _spriteCpnSecond.x = randomX.toDouble();

    _spriteCpnSecond.y = size.height / 2 + size.width / 10 - 20;

  }

  bool isMove = false;
  @override
  void update(double t) {
    super.update(t);

    if (_dino.isOnGround() && _dino.x > _spriteCpnFirst.x + 50) {
      //check vi tri dino tai y Min và kiểm tra xem vị trí của dino có lớn hơn cpn.x + 50(chiều rộng của cpn)


      // if (_dino.x < _spriteCpnSecond.x || _dino.x + 24 > _spriteCpnSecond.x + 50) {
      //   print('1111111111111111111111111111111111111');
      // }
      //
      // if (_dino.x >= _spriteCpnSecond.x && _dino.x + 24 <= _spriteCpnSecond.x + 50) {
      //   print('22222222222222222222222222222222222222');
      //   isMove = true;
      // }
      //
      // print('Dino    x ==  ${_dino.x}====_spriteCpnSecond.x ==  ${_spriteCpnSecond.x}========_dino.x + 24 =  ${_dino.x + 24}'
      //     '=================_spriteCpnSecond.x + 50 == ${_spriteCpnSecond.x + 50}');



      _spriteCpnFirst.x -= 10 * 50 * t;

      if (_spriteCpnFirst.x < -(_size.width / 2)) {
        _spriteCpnSecond.x = max(_spriteCpnSecond.x - (10 * 50 * t), xMin);
        _dino.x = max(_spriteCpnSecond.x - (10 * 50 * t), xMin);

        if (_spriteCpnSecond.x == xMin) {
          _spriteCpnFirst.x = xMin;

          int randomX = (size.width / 10).toInt() +
              50 +
              _random.nextInt(size.width.toInt() - 50 - (size.width / 10 + 50).toInt());
          _spriteCpnSecond.x = randomX.toDouble();
        }
      }
    }
  }

  @override
  void onTapDown(TapDownDetails details) {
    super.onTapDown(details);
    _dino.onTapDown(details);
  }

  @override
  void onTapUp(TapUpDetails details) {
    super.onTapUp(details);
    _dino.onTapUp(details);
  }

// @override
// void lifecycleStateChange(AppLifecycleState state) {
//   switch (state) {
//     case AppLifecycleState.resumed:
//       break;
//     case AppLifecycleState.inactive:
//       break;
//     case AppLifecycleState.paused:
//       break;
//     case AppLifecycleState.detached:
//       break;
//   }
// }
}
