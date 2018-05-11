import 'package:dnd_301_final/app_data.dart';
import 'package:dnd_301_final/session_screen.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrMakerWidget extends StatefulWidget {

  @override
  _QrMakerWidgetState createState() => new _QrMakerWidgetState();
}

class _QrMakerWidgetState extends State<QrMakerWidget> {

  bool qrGenComplete = false;

  @override
  void initState() {
    AppData.createSession().whenComplete(() {if(AppData.temp_session.status != 'FAILED') {qrGenComplete=true; setState(() {
      //update modal
    });}
    else
      {
        print('Error cannot create session!');
        Scaffold.of(context).showSnackBar(
            new SnackBar(duration: new Duration(seconds: 3) ,content: new Text('Error: Cannot create session!')));
        Navigator.of(context).pop();
      }
    });
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
                      builder: (BuildContext context) => new GameSessionDemo(AppData.temp_session),
                    ));
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


