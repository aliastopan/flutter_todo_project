import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Todo.dart';

class Services {
  static Future<List<Todo>> getTodo() async {
    try {
      var url = "http://192.168.31.224/flutter/fetchtodo.php";
      final response = await http.post(url);

      if (200 == response.statusCode) {
        List<Todo> list = parseResponse(response.body);
        return list;
      } else {
        return List<Todo>(0);
      }
    } catch (e) {
      return List<Todo>(0);
    }
  }

  static List<Todo> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Todo>((json) => Todo.fromJson(json)).toList();
  }

  static Future<void> addTodo(String todoctrl) async {
    print(todoctrl.isEmpty);
    try {
      var url = "http://192.168.31.224/flutter/addtodo.php";
      var map = Map<String, dynamic>();
      map['todoctrl'] = todoctrl;
      final response = await http.post(url, body: map);
      print("addTodo >> Response:: ${response.body}");
    } catch (e) {}
  }

  static Future<void> deleteTodo(String todoid) async {
    try {
      var url = "http://192.168.31.224/flutter/deletetodo.php";
      var map = Map<String, dynamic>();
      map['todoid'] = todoid;
      final response = await http.post(url, body: map);
      print("deleteTodo >> Response:: ${response.body}");
    } catch (e) {}
  }

  static Future<void> updateTodo(String todoid, String todoctrl) async {
    try {
      var url = "http://192.168.31.224/flutter/updatetodo.php";
      var map = Map<String, dynamic>();
      map['todoid'] = todoid;
      map['todoctrl'] = todoctrl;
      final response = await http.post(url, body: map);
      print("updateTodo >> Response:: ${response.body}");
    } catch (e) {}
  }
}
