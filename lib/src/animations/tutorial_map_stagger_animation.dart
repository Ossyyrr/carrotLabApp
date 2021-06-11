import 'package:flutter/material.dart';

class TutorialStaggerAnimation extends StatelessWidget {
  static const _textInitialScale = 0.0;
  static const _textNormalScale = 16.0;
  static const _textBigScale = 18.0;

  static const _nInitialOpacity = 0.0;
  static const _nNormalOpacity = 1.0;

  TutorialStaggerAnimation({
    Key? key,
    required this.controller,
  })  : scaleText = TweenSequence([
          TweenSequenceItem(
            tween: Tween<double>(
              begin: _textInitialScale,
              end: _textNormalScale,
            ).chain(CurveTween(curve: Curves.easeOut)),
            weight: 0.10,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: _textNormalScale,
              end: _textBigScale,
            ),
            weight: 0.50,
          ),
        ]).animate(controller),
        bgOpacity = TweenSequence([
          TweenSequenceItem(
            tween: Tween<double>(
              begin: _nInitialOpacity,
              end: _nNormalOpacity,
            ),
            weight: 0.15,
          ),
          TweenSequenceItem(
            tween: ConstantTween(_nNormalOpacity),
            weight: 0.75,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: _nNormalOpacity,
              end: _nInitialOpacity,
            ),
            weight: 0.10,
          ),
        ]).animate(controller),
        super(key: key);

  final AnimationController controller;
  final Animation<double> scaleText;
  final Animation<double> bgOpacity;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(builder: _buildAnimation, animation: controller);
  }

  Widget _buildAnimation(BuildContext context, Widget? e) {
    return Opacity(
      opacity: bgOpacity.value,
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Container(
          color: Colors.black.withOpacity(0.6),
          width: double.infinity,
          alignment: Alignment.center,
          height: 150,
          child: Text(
            // TODO traducir
            'Deja presionado un lugar \n del mapa para marcarlo',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: scaleText.value),
          ),
        ),
      ),
    );
  }
}
