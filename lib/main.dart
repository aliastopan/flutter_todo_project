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
            onPressed: () => Services.addTodo(todoctrl.text),
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  void adding(String todoctrl) {
    var url = "http://192.168.31.224/flutter/addtodo.php";
    var data = {'todoctrl': todoctrl};
    var response = http.post(url, body: data);
    print(response.toString());
  }
}
