import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

import 'glassFill.dart';

class WaterWidget extends StatelessWidget {
  WaterWidget ({@required this.flareController});

  final GlassLoadingFillController flareController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5,bottom: 2),
      decoration: BoxDecoration(
        border: Border.all(width: 5, color: Colors.deepOrange),
        shape: BoxShape.circle,
      ),
      height: 200.0,
      width: 200,
      child: FlareActor(
        "assets/fillWaterO.flr",
        controller: flareController,
        artboard: "Artboard",
      ),
    );
  }
}