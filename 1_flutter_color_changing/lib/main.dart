import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _bckColor = Colors.blueAccent;
  var flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black54, title: const Text("Change Color")),
        body: buildBody());
  }

  Widget buildBody() {
    return Center(
      child: Container(
        color: _bckColor,
        child: Center(
            child: ElevatedButton(
                onPressed: () {
                  onPress();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, foregroundColor: Colors.white),
                child: const Text("Change Color"))),
      ),
    );
  }

  onPress() {
    flag = !flag;
    setState(() {
      if (flag == true) {
        _bckColor = Colors.blueAccent;
      } else {
        _bckColor = Colors.greenAccent;
      }
    });
  }
}
