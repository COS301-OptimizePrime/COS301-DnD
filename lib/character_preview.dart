import 'dart:math';

import 'package:dnd_301_final/app_data.dart';
import 'package:dnd_301_final/character_creation.dart';
import 'package:dnd_301_final/character_selection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// fits into preview and contains details about character
class CharacterPreview extends StatelessWidget {
  final LocalCharacter char;

  CharacterPreview(this.char);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Text(
            char.title,
            style: Theme.of(context).textTheme.headline.copyWith(color: Colors.white)
        ),
        new Text('Stats'),
        new Container(
          height: AppData.screenHeight/4,
          child: new Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  flex: 1,
                  child: new Column(
                    children: <Widget>[
                      ///main stats
                      new Expanded(child: Stat.Int(value: char.intelligence,hasButtons: false,),),
                      new Expanded(child: Stat.Str(value: char.strength,hasButtons: false,),),
                      new Expanded(child: Stat.Dex(value: char.dexterity,hasButtons: false,),),
                    ],
                  ),
                ),
                new Expanded(
                  flex: 1,
                  child: new Column(
                    children: <Widget>[
                      ///main stats
                      new Expanded(child: Stat.Wis(value: char.wisdom,hasButtons: false,),),
                      new Expanded(child: Stat.Chr(value: char.charisma,hasButtons: false,),),
                      new Expanded(child: Stat.Con(value: char.constitution,hasButtons: false,),),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }
}

// shows a preview of the character on swipe
class CharacterSwipePreview extends AnimatedWidget
{
  final double screenOffset;
  final AnimationController controller;
  CharacterSwipePreview({Key key, Animation<double> animation, this.controller,this.screenOffset})
      :super(key: key, listenable: animation);

  double startPos;
  double endPos;

  static Widget cp = new Container();

  static setChar(LocalCharacter c)
  {
//    char = c;
    cp = new CharacterPreview(c);
  }

//  static LocalCharacter char = new LocalCharacter(
//      title: "Blank",
//      strength: 0,
//      dexterity: 0,
//      constitution: 0,
//      intelligence: 0,
//      wisdom: 0,
//      charisma: 0
//  );//updated when a swipe is detected

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
          cp = new Container();
        };},
      child: new Transform(
        transform: new Matrix4.translationValues(
            animation.value-screenOffset,0.0,0.0
        ),
        child: new Opacity(
          opacity: 0.8,
          child: new Container(
            width: MediaQuery.of(context).size.width*(0.75),//3/4 screen width
            height: MediaQuery.of(context).size.height,//double.infinity,
            child: cp,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

}