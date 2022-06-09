import 'package:audioplayers/audioplayers.dart';
import 'package:enstorys/data/data.dart';
import 'package:flutter/material.dart';

class StoryView extends StatefulWidget {
  var index;

  var pageIndex;
  StoryView(
    this.index,
  );
  @override
  State<StatefulWidget> createState() => _StoryView(
        index,
      );
}

class _StoryView extends State<StoryView> {
  Duration _duration = new Duration();
  Duration _position = new Duration();
  var pageIndex;

  _StoryView(
    this.index,
  );
  var index;

  AudioPlayer audioPlayer = AudioPlayer();
  AudioPlayer advancedPlayer = AudioPlayer();
  IconData _playIcon = Icons.play_arrow;
  IconData _stopIcon = Icons.stop;
  late IconData icon;
  bool isPlaying = false;
  //var sound = ;
  play() async {
    audioPlayer.setPlaybackRate(playbackRate: 0.8);
    if (isPlaying == false) {
      int result = await audioPlayer.play(myStories[index]["url"]);

      setState(() {
        // pageIndex = index + 1;
        isPlaying = true;
      });
      print("===== playing =====");
    } else if (isPlaying == true) {
      int result = await audioPlayer.stop();
      setState(() {
        isPlaying = false;
      });
      print("===== $result =====");
    }
  }

  //stop() async {
  // await audioPlayer.stop();
  // print("===== Stoped =====");
  // setState(() {
  //pageIndex = index;
  //   isPlaying = false;
  // });
  //}

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    audioPlayer.seek(newDuration);
  }

  @override
  void initState() {
    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        _duration = event;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        _position = event;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(children: [
      Expanded(
        child: ListView(children: [
          Container(
            alignment: Alignment.center,
            height: height / 5,
            width: double.infinity,
            child: Text(
              myStories[index]["name"],
            ),
          ),
          Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "${myStories[index]["content"]}",
                textAlign: TextAlign.center,
              )),
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: Text(
              "Source : Sait Link Adress",
              style:
                  TextStyle(fontSize: 10, decoration: TextDecoration.underline),
            ),
          )
        ]),
      ),
      Container(
        height: (height / 10),
        color: Colors.grey,
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(_position.toString().split(".")[0]),
                      Text(_duration.toString().split(".")[0])
                    ],
                  ),
                  Slider(
                      activeColor: Colors.purpleAccent,
                      inactiveColor: Colors.white60,
                      value: _position.inSeconds.toDouble(),
                      min: 0.0,
                      max: _duration.inSeconds.toDouble(),
                      onChanged: (double value) {
                        setState(() {
                          seekToSecond(value.toInt());
                          value = value;
                        });
                      })
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                  onPressed: play,
                  icon: Icon(
                    isPlaying == false ? icon = _stopIcon : icon = _playIcon,
                    size: 40,
                    color: Colors.purple,
                  )),
            )
          ],
        ),
      ),
    ]));
  }
}

 // String sound = 
  //  "https://firebasestorage.googleapis.com/v0/b/enstorys.appspot.com/o/Cent.mp3?alt=media&token=edfb0351-5adc-4de2-8853-a4cef0da149b";
  //"https://firebasestorage.googleapis.com/v0/b/enstorys.appspot.com/o/sound.mp3?alt=media&token=f7e6db5f-db4b-4084-9869-7aa6004cd958";
