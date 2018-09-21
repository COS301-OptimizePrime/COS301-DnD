import 'package:dnd_301_final/app_data.dart';
import 'package:dnd_301_final/character/character_selection.dart';
import 'package:dnd_301_final/home_page.dart';
import 'package:dnd_301_final/journals/monster_journal_new.dart';
import 'package:dnd_301_final/journals/race_viewer.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  AppData appData = AppData.instance();
  static String currentPage = "";

  @override
  Widget build(BuildContext context) {

    Widget displayImage;

    if(appData.userGoogleImage!=null)
      displayImage = new SizedBox(
        height: 108.0,
        width: 108.0,
        child: appData.userGoogleImage,
      );
    else
      displayImage = new Hero(
            tag: 'profile_pic',
            child: new CircleAvatar(
                radius: 54.0,
                backgroundImage: new AssetImage('assets/placeholder.jpg'),
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
                          displayImage,
                        ],
                      )
                  ),
                  decoration: new BoxDecoration(
                    color: Colors.deepOrange,
                  ),
                ),
                new ListTile(
                  key: new Key("menu_home_page_tile"),
                  title: new Text('Home Page'),
                  onTap: () {
                    Navigator.pop(context);
                    if(currentPage==HomePage.tag) return;

                    Navigator.pushNamed(context, HomePage.tag);
                    currentPage = HomePage.tag;
                  },
                ),
                new ListTile(
                  key: new Key("character_selection_page_tile"),
                  title: new Text('Character Selection'),
                  onTap: () {
                    // Update the state of the app
                    // pop menu
                    Navigator.pop(context);
                    //if not this page - go
                    if(currentPage==CharacterSelection.tag) return;
                    Navigator.pushNamed(context, CharacterSelection.tag);
                    currentPage = CharacterSelection.tag;
                  },
                ),
                new ListTile(
                  key: new Key("monster_journal_page_tile"),
                  title: new Text('Monster Journal'),
                  onTap: () {
                    // Update the state of the app
                    // ...

                    Navigator.pop(context);
                    Navigator.push(context, new MaterialPageRoute(builder: (context)=>new MonsterJournal()));
                  },
                ),
                new ListTile(
                  key: new Key("race_viewer_page_tile"),
                  title: new Text('View Races'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    Navigator.pop(context);
                    if(currentPage==RaceViewer.tag) return;

                    Navigator.pushNamed(context, RaceViewer.tag);
                    currentPage = RaceViewer.tag;
                  },
                ),
                const Divider(),
                new ListTile(
                  title: new Text('Sign Out'),
                  onTap: () async {
                    // Update the state of the app
                    // ...
                    await appData.signout();
                    Navigator.popUntil(context, ModalRoute.withName('login-page'));
                  },
                )
              ],
            )
        );








  }
}