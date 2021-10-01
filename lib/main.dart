import 'logic.dart';
import 'dart:io';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String no = '';
  String abt = '';
  String name = '';
  final s = Save();

  final i = Inimage();

  var ima;
  var getFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
            backgroundColor: Colors.grey[850],
            title: Text(
              'Profile',
              style: TextStyle(color: Colors.white),
            )),
        body: SingleChildScrollView(
            child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 200,
              height: 200,
              child: Stack(
                children: <Widget>[
                  ClipOval(
                      child: ima != null
                          ? Image.file(ima,
                              width: 200.0, height: 200.0, fit: BoxFit.fill)
                          : Container(
                              decoration: BoxDecoration(color: Colors.black),
                              width: 200,
                              height: 200,
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.grey[800],
                              ),
                            )),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      icon: const Icon(
                        Icons.add_a_photo_rounded,
                        color: Colors.pinkAccent,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        getFile = await i.im();
                        setState(() {
                          ima = File(getFile.path);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
                width: 330,
                child: TextField(
                    onSubmitted: (value) => name = value,
                    style: TextStyle(
                        fontSize: 21, height: 0.8, color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 20),
                      border: InputBorder.none,
                    ))),
            SizedBox(
              height: 30,
            ),
            SizedBox(
                width: 330,
                child: TextField(
                    onSubmitted: (value) => abt = value,
                    style: TextStyle(
                        fontSize: 21, height: 0.8, color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'About',
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 20),
                      border: InputBorder.none,
                    ))),
            SizedBox(
              height: 30,
            ),
            SizedBox(
                width: 330,
                child: TextField(
                    onSubmitted: (value) => no = value,
                    style: TextStyle(
                        fontSize: 21, height: 0.8, color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 20),
                      border: InputBorder.none,
                    ))),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                s.write(name, abt, no);
              },
              child: const Text('Save'),
            ),
          ]),
        )));
  }
}
