import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  getData() async {
    DocumentReference data = FirebaseFirestore.instance
        .collection("text")
        .doc("216QISrh4Fss3SjMUIuP");
    await data.get().then((value) {
      print(
          "=================================================================");
      print(value.data());
    });
  }

  @override
  void initState() {
    // getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _color = Colors.blue;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white60,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
              onPressed: () {
                Navigator.of(context).pushNamed("One");
              },
              //splashColor: Colors.black45,
              child: Container(
                alignment: Alignment.center,
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                    // border: Border.all(color: Colors.purple, width: 1.5),
                    // borderRadius: BorderRadius.circular(20),
                    //   gradient: LinearGradient(
                    //     begin: Alignment.topLeft,
                    //     end: Alignment.bottomRight,
                    //     colors: [
                    //       Colors.white,
                    //       _color,
                    //     ])
                    ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipPath(),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40,
                      child: Icon(
                        Icons.child_care_outlined,
                        size: 40,
                        color: Colors.purple,
                      ),
                    ),
                    Text(
                      "Stories",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "for Biginners",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
