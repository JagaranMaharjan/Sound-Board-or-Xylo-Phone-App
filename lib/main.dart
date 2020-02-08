import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(MusicalInstrument());

class MusicalInstrument extends StatelessWidget {
  Widget changeIcon({@required IconData icons}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        icons,
        color: Colors.white,
        size: 30,
      ),
    );
  }

  Widget buildButtonCard(
      {@required Color color,
      @required String cardText,
      @required int musicNo,
      @required IconData icons}) {
    return FlatButton(
      child: Card(
        color: color,
        elevation: 5,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icons,
                color: Colors.white,
                size: 30,
              ),
              Text(
                cardText,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "font2",
                    fontSize: 25),
              ),
            ],
          ),
        ),
      ),
      onPressed: () {
        changeIcon(icons: Icons.speaker);
        //appBarActionIcon();

        final getMusicName = AudioCache();
        getMusicName.play("note$musicNo.wav");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sound Board",
      home: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Image(
              image: AssetImage("images/xylophone.png"),
            ),
          ),
          title: Text(
            "Sound Board",
            style: TextStyle(
                color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            //appBarActionIcon(),
            changeIcon(icons: Icons.speaker_notes_off),
          ],
          backgroundColor: Colors.blue,
        ),
        body: GridView.count(
          padding: EdgeInsets.symmetric(vertical: 10),
          crossAxisSpacing: 40,
          crossAxisCount: 2,
          children: <Widget>[
            buildButtonCard(
                color: Colors.blue,
                cardText: "Note 1",
                musicNo: 1,
                icons: Icons.library_music),
            buildButtonCard(
                color: Colors.redAccent,
                cardText: "Note 2",
                musicNo: 2,
                icons: Icons.library_music),
            buildButtonCard(
                color: Colors.yellow,
                cardText: "Note 3",
                musicNo: 3,
                icons: Icons.library_music),
            buildButtonCard(
                color: Colors.orange,
                cardText: "Note 4",
                musicNo: 4,
                icons: Icons.library_music),
            buildButtonCard(
                color: Colors.green,
                cardText: "Note 5",
                musicNo: 5,
                icons: Icons.library_music),
            buildButtonCard(
                color: Colors.blueGrey,
                cardText: "Note 6",
                musicNo: 6,
                icons: Icons.library_music),
            buildButtonCard(
                color: Colors.deepOrange,
                cardText: "Note 7",
                musicNo: 7,
                icons: Icons.library_music),
            buildButtonCard(
                color: Colors.deepOrangeAccent,
                cardText: "Note 8",
                musicNo: 1,
                icons: Icons.library_music),
          ],
        ),
      ),
    );
  }
}
