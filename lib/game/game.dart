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

class DinoGame extends BaseGame with TapDetector {
  Dino _dino;
  BlackRect _blackRect;
  ParallaxComponent _parallaxComponent;
  TextComponent _scoreText;
  int score;

  DinoGame() {
    _parallaxComponent = ParallaxComponent([
      ParallaxImage('plx-1.png'),
      ParallaxImage('plx-2.png'),
      ParallaxImage('plx-3.png'),
      ParallaxImage('plx-4.png'),
      ParallaxImage('plx-5.png'),
      ParallaxImage('plx-6.png', fill: LayerFill.none),
    ], baseSpeed: Offset(0, 0));

    add(_parallaxComponent);

    _dino = Dino();
    add(_dino);

    _blackRect = BlackRect();
    add(_blackRect);

    score = 0;
    _scoreText = TextComponent(score.toString(),
        config: TextConfig(color: Colors.white, fontSize: 40));
    add(_scoreText);
  }

  @override
  void resize(Size size) {
    super.resize(size);

    _scoreText.setByPosition(Position(size.width / 2 - _scoreText.width, 100));
  }

  @override
  void update(double t) {
    super.update(t);
  }

  @override
  void onTapDown(TapDownDetails details) {
    super.onTapDown(details);
    // _dino.jump();
    _dino.onTapDown(details);
  }

  @override
  void onTapUp(TapUpDetails details) {
    super.onTapUp(details);
    _dino.onTapUp(details);
  }
}
