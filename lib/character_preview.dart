import 'dart:math';

import 'package:dnd_301_final/character_selection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// fits into preview and contains details about character
class CharacterPreview extends StatelessWidget {
  final LocalCharacter char;

  CharacterPreview(this.char);

  @override
  Widget build(BuildContext context) {

    List<TableRow> rows = <TableRow> [
      new TableRow(
          children: <Padding> [
            new Padding(padding: const EdgeInsets.only(left: 6.0),child: new Text('Strength')),
            new Padding(padding: const EdgeInsets.only(left: 6.0),child: new Text(char.strength.toString())),
          ]
      ),
      new TableRow(
          children: <Padding> [
            new Padding(padding: const EdgeInsets.only(left: 6.0),child: new Text('Dexterity')),
            new Padding(padding: const EdgeInsets.only(left: 6.0),child: new Text(char.dexterity.toString())),
          ]
      ),
      new TableRow(
          children: <Padding> [
            new Padding(padding: const EdgeInsets.only(left: 6.0),child: new Text('Constitution')),
            new Padding(padding: const EdgeInsets.only(left: 6.0),child: new Text(char.constitution.toString())),
          ]
      ),
      new TableRow(
          children: <Padding> [
            new Padding(padding: const EdgeInsets.only(left: 6.0),child: new Text('Intelligence')),
            new Padding(padding: const EdgeInsets.only(left: 6.0),child: new Text(char.intelligence.toString())),
          ]
      ),
      new TableRow(
          children: <Padding> [
            new Padding(padding: const EdgeInsets.only(left: 6.0),child: new Text('Wisdom')),
            new Padding(padding: const EdgeInsets.only(left: 6.0),child: new Text(char.wisdom.toString())),
          ]
      ),
      new TableRow(
          children: <Padding> [
            new Padding(padding: const EdgeInsets.only(left: 6.0),child: new Text('Charisma')),
            new Padding(padding: const EdgeInsets.only(left: 6.0),child: new Text(char.charisma.toString())),
          ]
      ),
    ];

    return new Column(
      children: <Widget>[
        new Text(
            char.title,
            style: Theme.of(context).textTheme.headline.copyWith(color: Colors.white)
        ),
        new Text('Stats'),
        new Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 0.0, 2.0, 2.0),
            child: new Table(
              children: rows,
              border: new TableBorder(
                  top: new BorderSide(width: 2.0, color: Colors.deepOrange),
                  bottom: new BorderSide(width: 2.0, color: Colors.deepOrange),
                  left: new BorderSide(width: 2.0, color: Colors.deepOrange),
                  right: new BorderSide(width: 2.0, color: Colors.deepOrange),
                  verticalInside: new BorderSide(width: 2.0, color: Colors.deepOrange)
              ),
            )
        )
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

  static LocalCharacter char = new LocalCharacter(
      title: "Blank",
      strength: 0,
      dexterity: 0,
      constitution: 0,
      intelligence: 0,
      wisdom: 0,
      charisma: 0
  );//updated when a swipe is detected

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
          opacity: 0.8,
          child: new Container(
            width: MediaQuery.of(context).size.width*(0.75),//3/4 screen width
            height: MediaQuery.of(context).size.height,//double.infinity,
            child: new CharacterPreview(char),
            color: Colors.black,
          ),
        ),
      ),
    );
  }

}