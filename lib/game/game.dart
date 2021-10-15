import 'package:flame/components/animation_component.dart';
import 'package:flame/components/component.dart';
import 'package:flame/components/parallax_component.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/spritesheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_game/game/dino.dart';

class DinoGame extends BaseGame with TapDetector{
  Dino _dino;
  ParallaxComponent _parallaxComponent;

  DinoGame() {
    _parallaxComponent = ParallaxComponent([
      ParallaxImage('plx-1.png'),
      ParallaxImage('plx-2.png'),
      ParallaxImage('plx-3.png'),
      ParallaxImage('plx-4.png'),
      ParallaxImage('plx-5.png'),
      ParallaxImage('plx-6.png', fill: LayerFill.none),
    ], baseSpeed: Offset(100, 0));

    add(_parallaxComponent);

    _dino = Dino();
    add(_dino);
  }

  @override
  void onTapDown(TapDownDetails details) {
    super.onTapDown(details);
    _dino.jump();
  }

}
