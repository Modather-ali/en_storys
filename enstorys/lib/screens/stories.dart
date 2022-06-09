import 'package:audioplayers/audioplayers.dart';
import 'package:enstorys/data/data.dart';
import 'package:enstorys/screens/story_view.dart';
import 'package:flutter/material.dart';

class Stories extends StatefulWidget {
  const Stories({Key? key}) : super(key: key);

  @override
  _StoriesState createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  late int pageIndex = 0;

  AudioPlayer audioPlayer = AudioPlayer();
  bool val = false;
  var Index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('En Stories'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: myStories.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                //   setState(() {
                //     pageIndex = myStories[index]["url"];
                //  });

                //    if (pageIndex != index) {
                //     await audioPlayer.stop();
                //  } else {}
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return StoryView(
                    index,
                  );
                }));
              },
              child: Column(
                children: [
                  ListTile(
                      title: Text("${myStories[index]["name"]}"),
                      trailing: Icon(
                        Icons.read_more_outlined,
                      )),
                  Divider(
                    height: 10,
                  )
                ],
              ),
            );
          }),
    );
  }
}

// var url = "https://firebasestorage.googleapis.com/v0/b/enstorys.appspot.com/o/Screenshot_20210807_114410_com.example.ui.jpg?alt=media&token=31fe62be-02b1-438e-8121-07e4724c8988";
