import 'package:flutter/material.dart';

class AnimationProvider extends ChangeNotifier {
  late final AnimationController tutorialMapController;
  bool showTutorialMap = false;

  AnimationProvider(BuildContext context) {
    //init
  }

  void startTuturialMapAnimation() {
    changeShowTutorialMap(true);
    tutorialMapController.forward().then((value) => {
          tutorialMapController.value = 0,
          changeShowTutorialMap(false),
        });
  }

  void changeShowTutorialMap(bool value) {
    showTutorialMap = value;
    notifyListeners();
  }
}
