// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class Monster {
  const Monster({
    this.assetName,
    this.title,
    this.description,
  });

  final String assetName;
  final String title;
  final String description;

  bool get isValid => assetName != null && title != null && description != null;
}

final List<Monster> monsters = <Monster>[
  const Monster(
    assetName: 'monster_images/beholder.jpg',
    title: 'Beholder',
    description: 'One glance at a beholder is enough to assess its foul and otherworldly nature.'
      ' A beholder’s spheroid body is covered in chitinous plates,'
      'scales, or leathery flesh.',
  ),
  const Monster(
    assetName: 'monster_images/fire_giant.jpg',
    title: 'Fire Giant',
    description: 'Master crafters and organized warriors, '
        'fire giants dwell among volcanoes, lava floes, and rocky mountains. '
        'They are ruthless militaristic brutes whose mastery of metalwork is legendary.',
  ),
  const Monster(
    assetName: 'monster_images/dragon.png',
    title: 'Dragon',
    description: 'True dragons are known and feared for their predatory cunning and their magic, '
        'with the oldest dragons accounted as some of the most powerful creatures in the world. ',
  ),
  const Monster(
    assetName: 'monster_images/yuan-ti.jpg',
    title: 'Yuan Ti',
    description: 'Devious serpent folk devoid of compassion, yuan-ti manipulate other creatures '
        'by arousing their doubts, evoking their fears, and elevating and crushing their hopes. ',
  )
];

//This is the mosnter card class - aka the Card's
class MonsterItem extends StatelessWidget {
  MonsterItem({ Key key, @required this.mon })
      : assert(mon != null && mon.isValid), //if it recieves a null monster object to populate the card, fatal error
        super(key: key);

  static const double height = 366.0; //just a value that fits nicely - consider calculating
  final Monster mon;


  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);//copy theme data from parent
    final TextStyle titleStyle = theme.textTheme.headline.copyWith(color: Colors.white);//make our title text look nice
    final TextStyle descriptionStyle = theme.textTheme.subhead; //give our description a matching style

    return new SafeArea(  //a type of widget
      top: false,
      bottom: false,
      child: new Container( // this container will hold our Card
        padding: const EdgeInsets.all(8.0),
        height: height,
        child: new Card(  //and here's the explicit Card widget
          child: new Column(  //everything in our card is ordered in a coloumn
            crossAxisAlignment: CrossAxisAlignment.start, //move to crossaxis (aka horizontal as we are vertical)'s start (left)
            children: <Widget>[
              // photo and title
              new SizedBox(//a box that is of explicit size
                height: 184.0,
                child: new Stack(//stacks allow us to place widgets on top of each other
                  children: <Widget>[
                    new Positioned.fill(//add image to bottom of stack
                      child: new Image.asset(
                        mon.assetName,
                        fit: BoxFit.cover,//fit image to box
                      ),
                    ),
                    new Positioned(//posititoned widgets can be moved within their parent (aka stack)
                      bottom: 16.0,
                      left: 16.0,
                      right: 16.0,
                      child: new FittedBox(//new box, fitted to remaining space
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,//place box left
                        child: new Text(mon.title,  //place a Text widget inside - aka our title - which is above our image on the stack
                          style: titleStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // description and view more button
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0), //padding from Left Top Right Bottom
                  child: new DefaultTextStyle( //text widget to pass a text styling down
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,//when text is too much for a container it should elipse (...)
                    style: descriptionStyle,
                    child: new Column(  //add a coloumn to allow our text to aign on x(horizontal) axis
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(mon.description, //our text widget with our descripion
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis //overflow
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // share, explore buttons
              new ButtonTheme.bar(  //this is the bar below our description that allows for 'button' widgets
                child: new ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new FlatButton( //a normal button without shape
                      child: const Text('View More'),//text for button
                      textColor: Colors.deepOrange, //color of text
                      //when our button is pushed perfrom the following:
                      //we are going to create a new widget (which is our new page) and push it to the top
                      // of our 'view' stack, thus forcing it to display without
                      //losing our current 'view'
                      //when we are done with our monster detail view
                      //it i s'popped' off the stack and we 'go back' to our
                      //previous screen - Navigator handles this stack
                      onPressed: () {Navigator.of(context).push(new MaterialPageRoute<Null>(
                        builder: (BuildContext context) { //build a new widget
                          return new Scaffold(  //new scaffold
                            appBar: new AppBar(
                              title: const Text('Monster Journal Entry'),//title of view
                            ),
                            body: new Column(
                                children: <Widget>[
                                      new SizedBox( //holds our image
                                        height: 184.0,
                                        child: new Stack( //this stack is redundant - was originally to place text name over image
                                          children: <Widget>[
                                          new Positioned.fill(
                                          child: new Image.asset(
                                          mon.assetName,
                                          fit: BoxFit.cover,
                                          ),
                                         ),
                                        ]
                                      ),
                                      ),
                                       new Row( //allows us to place items consecutively on the horizontal
                                        children: <Widget>[
                                          new Padding(  //padding on top and bottom to space from image box and description
                                            padding: new EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                                            child: new Text(mon.title,  //text box with name
                                              style: titleStyle,
                                              textAlign: TextAlign.left,),//aligned left of row
                                          ),
                                          const SizedBox(), //all rows must contain the same amount of coloumns
                                                            //so we use a 'blank' widget to fill holes in our 'table'
                                        ],
                                       ),

                                      new Padding(
                                          padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                                          child: new Container(
                                            key: key,
                                            child: new Text(mon.description, style: descriptionStyle),//our description
                                          )
                                      ),
                                      new Table(  //this table was to be used to hold the stats of the monster
                                        columnWidths: const <int, TableColumnWidth>{
                                          0: const FlexColumnWidth(1.0) //this means to resize children to fit all (1.0/1.0) available space
                                        },
                                        children: <TableRow>[ //a collection of rows in out stats table
                                          new TableRow( //only one for now - didnt add stats examples
                                              children: <Widget>[
                                                new Padding(
                                                    padding: const EdgeInsets.only(top: 24.0, bottom: 4.0),
                                                    //our stats text - styled to be blue and bold
                                                    child: new Text('Stats', style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, height: 24.0/15.0))
                                                ),
                                                const SizedBox(),//agian keep columns in each row the same
                                              ]
                                          ),
                                        ]
                                      ),
                                ],
                              ),
                          );
                        }
                      ));},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//main build function of our Monster Journal Page
//all 'build' functions are called when fast reload is used
//responisble for populating our page with Cards
class MonsterJournal extends StatelessWidget {
  static const String routeName = '/material/cards';//honestly i've removed this and it didnt do anyhting - lit no idea what it does
  //used to identify our 'scaffold' from anywhere - not used but a concept worth looking at
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return new MaterialApp( //return this whole monter journal as a widget to be displayed
      title: 'DnD 301 Use Case Demo',
      theme: new ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.grey,
          accentColor: Colors.deepOrange
      ),
      //Scaffolds are like vertical stacks - they hold widgets like a ladder from top to bottom
      home: new Scaffold(
          key: scaffoldKey,
          appBar: new AppBar( //AppBars are the bars on top of the view
            title: const Text('Monster Journal'),
          ),
          //this holds our 'Card's
          //it's a listview widget that 'lists'
          //widgets below each other.
          body: new ListView(
              itemExtent: MonsterItem.height,
              padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),//adds padding between cards and screen
              children: monsters.map((Monster mon) {  //this goes through all our monsters and makes a card for each
                return new Container(       //this is our 'card'
                    margin: const EdgeInsets.only(bottom: 8.0),
                    child: new MonsterItem(mon: mon)  //give our card a monster to use
                );
              }).toList()
          ),
      ),
    );
  }
}