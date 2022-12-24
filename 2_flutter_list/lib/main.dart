import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const Color darkBlue = Color.fromARGB(255, 13, 8, 34);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var array = ["Deneme", "Deneme2"];
  int num = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("List")), body: buildBody());
  }

  buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: array.length,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: ListTile(
                      onTap: () {},
                      tileColor: const Color.fromARGB(255, 160, 77, 77),
                      title: Text(array[index]),
                      leading: CircleAvatar(),
                      subtitle: const Text("Deneme")),
                );
              }),
        ),
        Row(children: [
          Flexible(
            fit: FlexFit.loose,
            flex: 1,
            child: Center(
              child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(200, 30)),
                  onPressed: () {
                    setState(() {
                      num++;
                      array.add("Yeni İtem $num");
                    });
                  },
                  child: const Text("Ekle")),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            flex: 1,
            child: Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      fixedSize: const Size(200, 30)),
                  onPressed: () {
                    setState(() {
                      if (array.isNotEmpty) {
                        array.removeLast();
                      } else {
                        num = 0;
                      }
                    });
                  },
                  child: const Text("Sil")),
            ),
          )
        ])
      ],
    );
  }
}
