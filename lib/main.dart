import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Services.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController todoctrl;

  @override
  void initState() {
    todoctrl = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TextField(
            controller: todoctrl,
            decoration: InputDecoration.collapsed(hintText: 'enter new task'),
          ),
          MaterialButton(
            onPressed: () => Services.updateTodo('38', 'chung'),
            child: Text('Update'),
          ),
        ],
      ),
    );
  }
}
