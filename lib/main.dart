import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
            onPressed: () => addTodo(todoctrl.text),
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

  Future<void> addTodo(String todoctrl) async {
    print(todoctrl.isEmpty);
    try {
      var url = "http://192.168.31.224/flutter/addtodo.php";
      var map = Map<String, dynamic>();
      map['todoctrl'] = todoctrl;
      final response = await http.post(url, body: map);
      print("addTodo >> Response:: ${response.body}");
    } catch (e) {}
  }
}
