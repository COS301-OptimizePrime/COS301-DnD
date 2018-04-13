import 'package:dnd_301_final/character_selection.dart';
import 'package:flutter/material.dart';
import 'package:dnd_301_final/monster_journal.dart';
import 'package:dnd_301_final/home_page.dart';
import 'package:dnd_301_final/app_data.dart';

class Menu extends StatelessWidget {
  AppData appData = AppData.instance();

  @override
  Widget build(BuildContext context) {

    if(appData.googleUser!=null)
      {

        final Hero google_image = new Hero(
            tag: 'profile_pic',
            child: new CircleAvatar(
                radius: 58.0,
                backgroundImage: new NetworkImage(appData.googleSignIn.currentUser.photoUrl,scale: 1.0),
            )
        );

//      final Image temp_image = new Image.network(appData.googleUser.photoUrl,width: 100.0,);
//      final Image gimage = temp_image;

//      final Container google_image = new Container(
//        height: 110.0,
//        child: gimage,
//      );

//      final google_image = new Container(
//        decoration: new BoxDecoration(
//          image: new DecorationImage(
//            image: gimage,
//            fit: BoxFit.cover,
//          ),
//        ),
//        child: null /* add child content content here */,
//      );

        return new Drawer(
            child: new ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                new DrawerHeader(
                  child: new SizedBox.expand(
                      child: new Column(
                        children: <Widget>[
                          new Text('D&D Game State Manager'),
                          google_image,
                        ],
                      )
                  ),
                  decoration: new BoxDecoration(
                    color: Colors.deepOrange,
                  ),
                ),
                new ListTile(
                  title: new Text('Home Page'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed(HomePage.tag);
                  },
                ),
                new ListTile(
                  title: new Text('Character Selection'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    Navigator.pop(context);
                    Navigator.pushNamed(context, CharacterSelection.tag);
                  },
                ),
                new ListTile(
                  title: new Text('Monster Journal'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    Navigator.pop(context);
                    Navigator.pushNamed(context, MonsterJournal.tag);
                  },
                ),
              ],
            )
        );
      }
      else
      {

        final Hero defaultImage = new Hero(
            tag: 'profile_pic',
            child: new CircleAvatar(
                radius: 58.0,
                backgroundImage: new AssetImage('assets/placeholder.jpg')
            )
        );

        return new Drawer(
            child: new ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                new DrawerHeader(
                  child: new SizedBox.expand(
                      child: new Column(
                        children: <Widget>[
                          new Text('D&D Game State Manager'),
                          defaultImage,
                        ],
                      )
                  ),
                  decoration: new BoxDecoration(
                    color: Colors.deepOrange,
                  ),
                ),
                new ListTile(
                  title: new Text('Home Page'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed(HomePage.tag);
                  },
                ),
                new ListTile(
                  title: new Text('Character Selection'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    Navigator.pop(context);
                    Navigator.pushNamed(context, CharacterSelection.tag);
                  },
                ),
                new ListTile(
                  title: new Text('Monster Journal'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    Navigator.pop(context);
                    Navigator.pushNamed(context, MonsterJournal.tag);
                  },
                ),
              ],
            )
        );
      }






  }
}