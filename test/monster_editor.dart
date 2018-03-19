import 'package:cos301_demo/monster_journal.dart';
import 'package:flutter/material.dart';

class MonsterEditor extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'DnD 301 Use Case Demo',
      theme: new ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.grey,
          accentColor: Colors.deepOrange
      ),
      home:  new Scaffold(
          appBar: new AppBar(
            title: const Text('New Monster'),
          ),
          body: new MonsterViewPane(),
      ),
    );
  }

}

class MonsterViewPane extends StatelessWidget{

  bool allowEdits;
  Monster newMonster;

  MonsterViewPane([Key key, bool edit, Monster monster])
      :allowEdits = edit,
        newMonster = monster,
        super(key: key);

  @override
  Widget build(BuildContext context) {

    return new Column(
    children: <Widget>[
        new Row(
          children: <Widget>[
            new SizedBox(
                height: 184.0,
                child: new Positioned.fill(
                  child: new Image.asset(
                    newMonster.assetName,
                    fit: BoxFit.cover,
                  ),
                )
            )
          ],
        ),
        new Row(
          children: <Widget>[
            new Text(
              newMonster.title,
              style: Theme.of(context).textTheme.headline.copyWith(color: Colors.white),

            )
          ],
        ),
        new Row(
          children: <Widget>[
            new Text(
                newMonster.description
            )
          ],
        )
      ],
    );
  }
}