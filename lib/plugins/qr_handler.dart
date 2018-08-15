import 'dart:async';

import 'package:dnd_301_final/app_data.dart';
import 'package:dnd_301_final/backend/server.pb.dart';
import 'package:dnd_301_final/session/lobby_screen.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrMakerWidget extends StatefulWidget {

  @override
  _QrMakerWidgetState createState() => new _QrMakerWidgetState();

  QrMakerWidget();
}

class _QrMakerWidgetState extends State<QrMakerWidget> {

  bool qrGenComplete = false;
  Session seshToPass;
  String name;
  bool generating = true;
  final myControler = new TextEditingController();
  final myControlerNumberInput = new TextEditingController();
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    if(qrGenComplete)
      return new Dialog(child: new Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Container(
                child: new Text("Scan the QR code to join!",style: new TextStyle(fontSize: 20.0,color: Colors.deepOrange),),
              ),
            ),
            new Container(
              color: Colors.white,
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    new QrImage(data: AppData.sessionId, size: 250.0,)
                  ]),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Container(
                child: new MaterialButton(
                  minWidth: 200.0,
                  height: 42.0,
                  onPressed: () {
                    Navigator.push(context, new MaterialPageRoute(
                      builder: (BuildContext context) => new GameSession(seshToPass),
                    ));
                    Navigator.pop(context);
                  },
                  color: Colors.deepOrange,
                  child: new Text(
                      'Enter Session', style: new TextStyle(color: Colors.white)),
                )
              ),
            ),

          ]),
      );

    else
      if(generating)
      {
        return new Dialog(child: new Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new Container(
                  child: new Text("Enter your session details: ",style: new TextStyle(fontSize: 20.0,color: Colors.deepOrange),),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child:new TextField(
                  controller: myControler,
                  decoration: new InputDecoration(
                      labelText: 'Please enter a session name: '
                  ),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child:new TextField(
                  controller: myControlerNumberInput,
                  decoration: new InputDecoration(labelText: "Enter the maximum number of players: "),
                  keyboardType: TextInputType.number,
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new Container(
                    child: new MaterialButton(
                      minWidth: 200.0,
                      height: 42.0,
                      onPressed: () {
                        generating = false;
                        Future<Session> s = AppData.createSession(myControler.text, int.parse(myControlerNumberInput.text));
                        s.then((Session tempSesh) {
                          if(tempSesh.status != 'FAILED')
                          {
                            seshToPass = tempSesh;
                            qrGenComplete=true; setState((){});
                          }
                          else
                          {
                            print('Error cannot create session!');
                            Navigator.of(context).pop();
                          }
                        });
                        s.catchError((e){ print('Error cannot create session!');
                        Navigator.of(context).pop();});
                        setState((){});
                      },
                      color: Colors.deepOrange,
                      child: new Text(
                          'Create Session', style: new TextStyle(color: Colors.white)),
                    )
                ),
              ),

            ]),
        );
      }
    return new Dialog(child: new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Container(
              child: new Text("Generating Session...",style: new TextStyle(fontSize: 20.0,color: Colors.deepOrange),),
            ),
          ),
          new Container(
            color: Colors.white,
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  new RefreshProgressIndicator(
                    strokeWidth: 2.0,
                  )
                ]),
          ),
    ])
    );}
}

class QrReaderWaiter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Dialog(child: new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Container(
              child: new Text("Joining Session...",style: new TextStyle(fontSize: 20.0,color: Colors.deepOrange),),
            ),
          ),
          new Container(
            color: Colors.white,
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  new RefreshProgressIndicator(
                    strokeWidth: 2.0,
                  )
                ]),
          ),
        ])
    );
  }
}


