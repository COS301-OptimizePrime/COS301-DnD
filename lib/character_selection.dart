import 'dart:async';
import 'dart:math';

import 'package:dnd_301_final/app_data.dart';
import 'package:dnd_301_final/character_creation.dart';
import 'package:dnd_301_final/character_preview.dart';
import 'package:dnd_301_final/menu.dart';
import 'package:dnd_301_final/races_and_classes.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class LocalCharacter {

  LocalCharacter({
    this.characterId,
    this.title,
    this.charClass,
    this.charRace,
    this.charGender,
    this.strength,
    this.dexterity,
    this.constitution,
    this.intelligence,
    this.wisdom,
    this.charisma,
    this.background = '',
    this.personality = '',
    this.ideals = '',
    this.bonds = '',
    this.flaws = '',
    this.featuresTraits = '',
    this.equipment,
  });

  final String assetName;
  final String title;
  final String characterId;

  final ClassType charClass;
  final Race charRace;
  final String charGender;
  List<LocalEquipment> equipment;

  final int strength;
  final int dexterity;
  final int constitution;
  final int intelligence;
  final int wisdom;
  final int charisma;

  final String background;
  final String personality;
  final String ideals;
  final String bonds;
  final String flaws;
  final String featuresTraits;

  Race race;
  ClassType classType;

  bool isValid(){
    return (title != null && charClass != null && charRace != null && charGender != null);
  }

}

final List<LocalCharacter> characters = new List();

class CharacterItem extends StatelessWidget {
  CharacterItem({ Key key, @required this.char })
      : assert(char !=null), //if it receives a null character object to populate the card, fatal error
        super(key: key);

  static const double height = 160.0; // original value was 366.0
  LocalCharacter char;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);//copy theme data from parent
    final TextStyle titleStyle = theme.textTheme.headline.copyWith(color: Colors.white);//make our title text look nice
    final TextStyle descriptionStyle = theme.textTheme.subhead; //give our description a matching style

    SizedBox title;

    title = new SizedBox(
      height: 60.0,
      child: new Padding(
        padding: new EdgeInsets.only(left: 16.0),
        child: new FittedBox(//new box, fitted to remaining space
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,//place box left
          child: new Text(char.title,  //place a Text widget inside - aka our title - which is above our image on the stack
            style: titleStyle,
          ),
        ),
      )
    );

    SizedBox racePreview = new SizedBox(
      height: 60.0,
      width: 60.0,
      child: new Stack(
        children: <Widget>[
          new Positioned.fill(//add image to bottom of stack
            child: new Image.asset('assets/race_images/'+char.charRace.getImage()+'.png',fit: BoxFit.scaleDown,)
          ),
          new Positioned(//positioned widgets can be moved within their parent (aka stack)
            bottom: 1.0,
            left: 1.0,
            right: 1.0,
            child: new FittedBox(//new box, fitted to remaining space
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,//place box left
              child: Text(char.charRace.name)
            ),
          ),
        ]
      ),
    );


    SizedBox classPreview = new SizedBox(
      height: 60.0,
      width: 60.0,
      child: new Stack(
          children: <Widget>[
            new Positioned.fill(//add image to bottom of stack
                child: new Image.asset('assets/class_images/'+char.charClass.name+'.png',fit: BoxFit.scaleDown,)
            ),
            new Positioned(//positioned widgets can be moved within their parent (aka stack)
              bottom: 1.0,
              left: 1.0,
              right: 1.0,
              child: new FittedBox(//new box, fitted to remaining space
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,//place box left
                  child: Text(char.charClass.name)
              ),
            ),
          ]
      ),
    );

    GestureDetector card = new GestureDetector(
      child: new Card(child: new Column(
        //move to crossaxis (aka horizontal as we are vertical)'s start (left)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            title,
            new Padding(
              padding: new EdgeInsets.only(left: 16.0, right: 16.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  racePreview,
                  classPreview,
                  new Text(char.charGender), //our text widget with our description
                ],
              )
            )
          ]
      )),
    );

    int armorClass = 0;

    if (char.equipment != null) {
      char.equipment.forEach((item) {
            if (item != null && !item.isWep)
              armorClass += item.val;
          }
      );
    }
    else {
      armorClass = 0;
    }

    // A detailed view of the character that is called when a character card is tapped
    ListView detailedView = new ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          title,
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              racePreview,
              classPreview,
              new Text(char.charGender), //our text widget with our description
            ],
          ),

          new Padding(
            padding: new EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: new Divider(
              color: theme.accentColor,
            ),
          ),

          new Text(
            'Stats: ',
            style: titleStyle,
          ),
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

          new Text(char.background),
          new Text(char.personality),
          new Text(char.ideals),
          new Text(char.bonds),
          new Text(char.flaws),
          new Text(char.featuresTraits),

          new Divider(),

          (char.equipment != null) ? Shield(armorClass)//Text(char.equipment.length.toString())
              : Text("0"),

          Container(
            width: AppData.screenWidth,
            height: AppData.screenHeight/2,
            child: (char.equipment != null && char.equipment.length>0) ? EquipmentList(char: char) : new Column(),
          ),


          new Center(
            child: new Container(
              width: AppData.screenWidth/3,
              height: AppData.screenHeight/20,
              child: new DeleteButton(charId: char.characterId),
            ),
          )

        ]
    );

    return new SafeArea(
        top: false,
        bottom: false,
        // Allow user to tap card
        child: new GestureDetector(
            onTap: () {
              if(!CharacterSelection.inPreviewState)
                Navigator.of(context).push(new MaterialPageRoute<Null>(
                builder: (BuildContext context) {
                  //build a new widget
                  return new Scaffold( //new scaffold
                      appBar: new AppBar(
                        title: const Text('Character Details'), //title of view
                        actions: <Widget>[
                          IconButton(icon: Icon(Icons.edit), onPressed: (){
                            Navigator.push(
                                context, new MaterialPageRoute<LocalCharacter>(
                              builder: (
                                  BuildContext context) => new FullScreenDialog(char: char,),
                              fullscreenDialog: true,
                            )).then((val){if(val!=null)
                              //@TODO: implement update on return
                              ;});
                          })
                        ],
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

class EquipmentList extends StatefulWidget {

  final LocalCharacter char;

  EquipmentList({
    this.char,
});

  @override
  _EquipmentListState createState() => _EquipmentListState();
}

class _EquipmentListState extends State<EquipmentList> {

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: widget.char.equipment.length,
        itemBuilder: (context, index) {

          final item = widget.char.equipment[index];

          if(item==null)
            return Container();

           return Dismissible(
            child: new Container(
              padding: EdgeInsets.all(5.0),
              child: EquipmentWidget(
                item: item,
              ),
            ),
            // Each Dismissible must contain a Key. Keys allow Flutter to
            // uniquely identify Widgets.
            key: UniqueKey(),
            // We also need to provide a function that will tell our app
            // what to do after an item has been swiped away.
            onDismissed: (direction) {


              widget.char.equipment.removeAt(index);

              AppData.removeEquipment(widget.char,index);

              setState(() {
                //redraw list
              });

              Scaffold
                  .of(context)
                  .showSnackBar(
                  SnackBar(content: Text("$item deleted")));

            },
            background: Container(color: Colors.red),
          );
        }
    );
  }
}


class DeleteButton extends StatefulWidget {

  final String charId;

  DeleteButton({
    this.charId,
});

  @override
  _DeleteButtonState createState() => _DeleteButtonState();
}

class _DeleteButtonState extends State<DeleteButton> {


  bool confirmDelete = false;

  delete()
  {
   if(confirmDelete) {
     AppData.deleteCharacter(widget.charId);
     Navigator.pop(context);
   }
   else
     {
       setState(() {
         confirmDelete = true;
         message = "Confirm?";
       });
     }
  }


  String message = "Delete";
  @override
  Widget build(BuildContext context) {
    return new FlatButton(onPressed: (){delete();},
      child: new Container(
//                    width: AppData.screenWidth/8,
        child: Row(
          children: <Widget>[
            Expanded(child: Container(),),
            Text(message),
            Icon(Icons.delete),
            Expanded(child: Container(),),
          ],
        ),
      ),
      color: Colors.redAccent,
    );
  }
}


class CharacterSelection extends StatefulWidget {
  static String tag = 'character-selection';
  static bool inPreviewState = false;


  @override
  CharacterSelectionState createState() => new CharacterSelectionState();
}

class CharacterSelectionState extends State<CharacterSelection> with SingleTickerProviderStateMixin
{

  CharacterSelectionState()
  {
    AppData.getUseCharacters().whenComplete(
        (){setState(() {
          //update characters
          print('updating character list');
        });}
    );
  }

  AnimationController controller;
  Animation<double> animation;
  double screenWidthOffset = AppData.screenWidth*0.75;

  @override
  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    animation = new Tween(begin: 0.0, end: screenWidthOffset).animate(controller);
//    controller.forward();
  }

  Future<Null> updateCharacters() async
  {
    AppData.updateUserCharacters().whenComplete(
        (){
          print('updating character list');
          setState(() {
            //update list
          });
        }
    );

    return null;
  }


  @override
  Widget build(BuildContext context) {

    //setup for animation
//    CharacterSwipePreview.screenOffset = MediaQuery.of(context).size.width*-0.75;
//    controller = new AnimationController(
//        duration: const Duration(milliseconds: 200), vsync: this);
//    animation = new Tween(begin: 0.0, end: MediaQuery.of(context).size.width*0.75).animate(controller);
////    controller.forward();

    double swipeStart;
    double swipeEnd;

    return new Scaffold(
        body: new Stack(
          children: <Widget>[
            new RefreshIndicator(
              onRefresh: updateCharacters,
              child: new ListView(
                  itemExtent: CharacterItem.height,
                  padding: const EdgeInsets.only(
                      top: 8.0, left: 8.0, right: 8.0),
                  //adds padding between cards and screen
                  children: characters.map((
                      LocalCharacter char) { //this goes through all our characters and makes a card for each
                    return new Container( //this is our 'card'
                        margin: const EdgeInsets.only(bottom: 8.0),
                        child: new GestureDetector(
                            onHorizontalDragStart: (start) {
                              swipeStart = start.globalPosition.dx;
                            },
                            onHorizontalDragUpdate: (update) {
                              swipeEnd = update.globalPosition.dx;
                            }, //open preview
                            onHorizontalDragEnd: (end) {
                              print('Start: $swipeStart \nEnd: $swipeEnd');
                              if (swipeEnd > swipeStart &&
                                  sqrt(pow((swipeEnd - swipeStart), 2)) < 300) {
                                controller.forward();
                                CharacterSelection.inPreviewState = true;
//                                                                CharacterSwipePreview.char = char;
                                CharacterSwipePreview.setChar(char);
                              }
                              swipeStart = swipeEnd = 0.0;
                            },
                            child: new CharacterItem(
                                char: char)) //give our card a character to use
                    );
                  }).toList()
              ),
            ),
            new CharacterSwipePreview(animation: animation,
              controller: controller,
              screenOffset: screenWidthOffset,),
          ],
        ),
        drawer: new Menu(),
        appBar: new AppBar( //AppBars are the bars on top of the view
          title: const Text('Character Selection'),
        ),
        floatingActionButton: new FloatingActionButton(
            child: new Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context, new MaterialPageRoute<DismissDialogAction>(
                builder: (BuildContext context) => new FullScreenDialog(),
                fullscreenDialog: true,
              )).then((val) {
                if (val == DismissDialogAction.save) updateCharacters();
              });
            }
        )
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }

}
