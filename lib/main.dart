import 'dart:convert';


import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.teal), home: const HomePage()));

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Load Json App"),
      ),
      body: Center(
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString('load_json/person.json'),
          builder: (context, snapshot) {
            // Decode json
            var mydata = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("Name:" + mydata[index]['name']),
                      Text("Age:" + mydata[index]['age']),
                      Text("Height:" + mydata[index]['height']),
                      Text("Gender:" + mydata[index]['gender']),
                      Text("Hair_Color:" + mydata[index]['hair_color']),
                    ],
                  ),
                );
              },
              itemCount: mydata == null ? 0 : mydata.length,
            );
          },
        ),
      ),
    );
  }
}
