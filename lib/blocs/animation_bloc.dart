import 'package:flutter/cupertino.dart';
import 'package:meal_plan/animation/glassFill.dart';

class AnimationBloc with ChangeNotifier{

  GlassLoadingFillController flareController = GlassLoadingFillController();
  static const int selectedGlass = 10;
  int currentGlass = 0;
  int numPercentage = 0;
  int numMl = 0;

  void addWater() {

      if (currentGlass <= selectedGlass) {
        currentGlass = currentGlass + 1;
        double percentToAdd = currentGlass / selectedGlass;
        flareController.updateWater(percentToAdd);
      }
      numPercentage+=10;
      numMl+=300;
 notifyListeners();
  }

  void subWater() {

      if (currentGlass <= selectedGlass) {
        currentGlass = currentGlass - 1;
        double percentToSub = currentGlass / selectedGlass;
        flareController.updateWater(percentToSub);
      }
      numPercentage-=10;
      numMl-=300;
    notifyListeners();
  }




}

