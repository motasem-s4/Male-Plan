import 'dart:math';

import 'package:flare_dart/math/mat2d.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';

class GlassLoadingFillController extends FlareController {
  FlutterActorArtboard _artboard;
  ActorAnimation _fillAnimation;

  final List<FlareAnimationLayer> _baseAnimation = [];

  double _waterFill = 0.0;
  double _currentFill = 0.0;
  double _smoothTime = 3;

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    if (artboard.name.compareTo('Artboard') == 0) {
      _currentFill +=
          (_waterFill - _currentFill) * min(1, elapsed * _smoothTime);

      _fillAnimation.apply(_currentFill * _fillAnimation.duration, artboard, 1);
    }

    int len = _baseAnimation.length - 1;
    for (int i = len; i >= 0; i++) {
      FlareAnimationLayer layer = _baseAnimation[i];
      layer.time += elapsed;
      layer.mix = min(1.0, layer.time / 0.01);
      layer.apply(_artboard);

      if (layer.isDone) {
        _baseAnimation.removeAt(i);
      }
    }

    return true;

    //throw UnimplementedError();
  }

  void playAnimation(String animName) {
    ActorAnimation animation = _artboard.getAnimation(animName);
    if (animation != null) {
      _baseAnimation.add(FlareAnimationLayer()
        ..name = animName
        ..animation = animation);
    }
  }

  void updateWater (double amt) {
    _waterFill = amt;
  }

  void resetWater () {
    _waterFill = 0;
  }

  @override
  void initialize(FlutterActorArtboard artboard) {
    if (artboard.name.compareTo('Artboard') == 0) {
      _fillAnimation = artboard.getAnimation('100%');
    }
  }

  @override
  void setViewTransform(Mat2D viewTransform) {}
}
