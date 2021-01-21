import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Todo.dart';

class ServicesOld {
  static const ROOT = 'http://10.0.2.2:8000/flutter/todo.php';
  static const _GET_ALL_ACTION = 'GET_ALL_TODO';
  static const _ADD_TODO_ACTION = 'ADD_TODO';
  static const _UPDATE_TODO_ACTION = 'UPDATE_TODO';
  static const _DELETE_TODO_ACTION = 'DELETE_TODO';

  static Future<List<Todo>> getTodo() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_ACTION;
      final response = await http.post(ROOT, body: map);

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

  static Future<String> addTodo(String todo) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _ADD_TODO_ACTION;
      map['to_do'] = todo;
      final response = await http.post(ROOT, body: map);
      print("addTodo >> Response:: ${response.body}");
      if (200 == response.statusCode) {
        List<Todo> list = parseResponse(response.body);
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  static Future<String> updateTodo(int id, String todo) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _UPDATE_TODO_ACTION;
      map['id'] = id;
      map['to_do'] = todo;
      final response = await http.post(ROOT, body: map);
      print("updateTodo >> Response:: ${response.body}");

      if (200 == response.statusCode) {
        List<Todo> list = parseResponse(response.body);
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  static Future<String> deleteTodo(int id) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _DELETE_TODO_ACTION;
      map['id'] = id;
      final response = await http.post(ROOT, body: map);
      print("deleteTodo >> Response:: ${response.body}");

      if (200 == response.statusCode) {
        List<Todo> list = parseResponse(response.body);
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }
}
