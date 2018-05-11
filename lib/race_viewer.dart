import 'package:dnd_301_final/menu.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Race {
  const Race({
    this.assetName,
    this.title,
    this.description,
  });

  final String assetName;
  final String title;
  final String description;

  bool get isValid => assetName != null && title != null && description != null;
}

final List<Race> races = <Race>[
  const Race(
    assetName: 'assets/race_images/human_race.jpg',
    title: 'Human',
    description: 'In the reckonings of most worlds, humans are the'
      'youngest of the common races, late to arrive on the'
      'world scene and short-lived in comparison to dwarves,'
      'elves, and dragons. Perhaps it is because of their shorter'
      'lives that they strive to achieve as much as they can in'
      'the years they are given. Or maybe they feel they have'
      'something to prove to the elder races, and that’s why'
      'they build their mighty empires on the foundation of'
      'conquest and trade. Whatever drives them, humans'
      'are the innovators, the achievers, and the pioneers'
      'of the worlds.',
  ),
  const Race(
    assetName: 'assets/race_images/dragonborn_race.jpg',
    title: 'Dragonborn',
    description: 'Born of dragons, as their name proclaims, the'
        'dragonborn walk proudly through a world that greets'
        'them with fearful incomprehension. Shaped by draconic'
        'gods or the dragons themselves, dragonborn originally'
        'hatched from dragon eggs as a unique race, combining'
        'the best attributes of dragons and humanoids. Some'
        'dragonborn are faithful servants to true dragons, others'
        'form the ranks of soldiers in great wars, and still others'
        'find themselves adrift, with no clear calling in life.',
  ),
  const Race(
    assetName: 'assets/race_images/orc_race.jpeg',
    title: 'Half-Orc',
    description: 'Whether united under the leadership of a mighty'
        'warlock or having fought to a standstill after years'
        'of conflict, orc and human tribes sometimes form'
        'alliances, joining forces into a larger horde to the terror'
        'of civilized lands nearby. When these alliances are'
        'sealed by marriages, half-orcs are born. Some half-orcs'
        'rise to become proud chiefs of orc tribes, their human'
        'blood giving them an edge over their full-blooded orc'
        'rivals. Some venture into the world to prove their worth'
        'among humans and other more civilized races. Many of'
        'these become adventurers, achieving greatness for their'
        'mighty deeds and notoriety for their barbaric customs'
        'and savage fury.',
  ),
  const Race(
    assetName: 'assets/race_images/elf_race.jpg',
    title: 'Elf',
    description: 'Elves are a magical people of otherworldly grace, living'
        'in the world but not entirely part of it. They live in'
        'places of ethereal beauty, in the midst of ancient forests'
        'or in silvery spires glittering with faerie light, where'
        'soft music drifts through the air and gentle fragrances'
        'waft on the breeze. Elves love nature and magic, art'
        'and artistry, music and poetry, and the good things'
        'of the world.',
  )
];

//This is the monster card class - aka the Cards
class RaceItem extends StatelessWidget {
  RaceItem({ Key key, @required this.racetype })
      : assert(racetype != null && racetype.isValid), //if it receives a null monster object to populate the card, fatal error
        super(key: key);

  static const double height = 187.0; // original value was 366.0
  final Race racetype;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);//copy theme data from parent
    final TextStyle titleStyle = theme.textTheme.headline.copyWith(color: Colors.white);//make our title text look nice
    final TextStyle descriptionStyle = theme.textTheme.subhead; //give our description a matching style

    //a box that is of explicit size
    SizedBox photoAndTitle = new SizedBox(
      height: 92.0, // 184.0 is original height
      child: new Stack(//stacks allow us to place widgets on top of each other
        children: <Widget>[
          new Positioned.fill(//add image to bottom of stack
            child: new Image.asset(
              racetype.assetName,
              fit: BoxFit.cover,//fit image to box
              alignment: Alignment.topCenter,
            ),
          ),
          new Positioned(//positioned widgets can be moved within their parent (aka stack)
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
            child: new FittedBox(//new box, fitted to remaining space
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,//place box left
              child: new Text('   ',   //place a Text widget inside - aka our title - which is above our image on the stack
                style: titleStyle,
              ),
            ),
          ),
        ],
      ),
    );

    // description
    Expanded description = new Expanded(
      child: new Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0), //padding from Left Top Right Bottom
        child: new DefaultTextStyle( //text widget to pass a text styling down
          softWrap: false,
          overflow: TextOverflow.ellipsis,//when text is too much for a container it should elipse (...)
          style: descriptionStyle,
          child: new SizedBox.expand(  //add a column to allow our text to aign on x(horizontal) axis
            child: new Text(racetype.title, //our text widget with our description
                maxLines: 3,
                overflow: TextOverflow.ellipsis, //overflow
              style: titleStyle,
            ),
          ),
        ),
      ),
    );

    Card card = new Card(child: new Column(
      //move to crossaxis (aka horizontal as we are vertical)'s start (left)
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          photoAndTitle,
          description
        ]
    ));

    // A detailed view of the monster that is called when a monster card is tapped
    ListView detailedView = new ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          new SizedBox( //holds our image
              height: 184.0,
              child: new Stack( //this stack is redundant - was originally to place text name over image
                  children: <Widget>[
                    new Positioned.fill(
                        child: new Image.asset(
                          racetype.assetName,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        )
                    )
                  ]
              )
          ),
          new Row( //allows us to place items consecutively on the horizontal
            children: <Widget>[
              new Padding(  //padding on top and bottom to space from image box and description
                padding: new EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                child: new Text(racetype.title,  //text box with name
                  style: titleStyle,
                  textAlign: TextAlign.center,),//aligned left of row
              ),
              const SizedBox(), //all rows must contain the same amount of columns
              //so we use a 'blank' widget to fill holes in our 'table'
            ],
          ),
          new Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 4.0),
              child: new Container(
                key: key,
                child: new Text(racetype.description, style: descriptionStyle),//our description
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
                          padding: const EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 4.0),
                          //our stats text - styled to be blue and bold
                          child: new Text('Stats', style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, height: 24.0/15.0))
                      ),
                      const SizedBox(),//agian keep columns in each row the same
                    ]
                ),
              ]
          ),
        ]
    );

    return new SafeArea(
        top: false,
        bottom: false,
        // Allow user to tap card
        child: new GestureDetector(
            onTap: () {Navigator.of(context).push(new MaterialPageRoute<Null>(
                builder: (BuildContext context) {
                  //build a new widget
                  return new Scaffold( //new scaffold
                      appBar: new AppBar(
                        title: const Text('Races'), //title of view
                      ),
                      body: detailedView
                  );
                }
            ));},
            child: new Container(
                padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                height: height,
                child: card
            )
        )
    );
  }
}

//main build function of our Monster Journal Page
//all 'build' functions are called when fast reload is used
//responisble for populating our page with Cards
class RaceViewer extends StatelessWidget {
  static const String routeName = '/material/cards';//honestly i've removed this and it didnt do anyhting - lit no idea what it does

  static String tag = 'race-viewer';

  @override
  Widget build(BuildContext context) {
    return  new Scaffold(
      drawer: new Menu(),
      appBar: new AppBar( //AppBars are the bars on top of the view
        title: const Text('Races'),
      ),
      //this holds our 'Card's
      //it's a listview widget that 'lists'
      //widgets below each other.
      body: new ListView(
          itemExtent: RaceItem.height,
          padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),//adds padding between cards and screen
          children: races.map((Race race) {  //this goes through all our monsters and makes a card for each
            return new Container(       //this is our 'card'
                margin: const EdgeInsets.only(bottom: 8.0),
                child: new RaceItem(racetype: race)  //give our card a monster to use
            );
          }).toList()
      ),
    );
  }
}