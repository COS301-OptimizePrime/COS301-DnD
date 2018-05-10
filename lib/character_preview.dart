import 'dart:math';

import 'package:dnd_301_final/character_selection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CharacterSwipePreview extends AnimatedWidget
{

  final double screenOffset;
  final AnimationController controller;
  CharacterSwipePreview({Key key, Animation<double> animation, this.controller,this.screenOffset})
      : super(key: key, listenable: animation);

  double startPos;
  double endPos;

  static Character char;//updated when a swipe is detected

  bool swipeLeft()
  {
    print('Start: $startPos \nEnd: $endPos');
    return endPos<startPos;//then was a left swipe
  }

  @override
  Widget build(BuildContext context) {

    final Animation<double> animation = listenable;
    return new GestureDetector(
      onHorizontalDragStart: (start){startPos = start.globalPosition.dx;},
      onHorizontalDragUpdate: (update){endPos = update.globalPosition.dx;},
      onHorizontalDragEnd: (end){
        if(swipeLeft() && sqrt(pow((endPos-startPos),2)) < 300){
          controller.reverse(from: controller.value);
          CharacterSelection.inPreviewState=false;
        };},
      child: new Transform(
        transform: new Matrix4.translationValues(
            animation.value-screenOffset,0.0,0.0
        ),
        child: new Opacity(
          opacity: animation.value/screenOffset,
          child: new Container(
            width: MediaQuery.of(context).size.width*(0.75),//3/4 screen width
            height: double.infinity,
            child: const FlutterLogo(),
            color: Colors.red,

          ),
        ),
      ),
    );
  }

}