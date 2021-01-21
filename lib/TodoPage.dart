import 'package:flutter/material.dart';
import 'Todo.dart';
import 'Services.dart';

class TodoPage extends StatefulWidget {
  TodoPage() : super();
  final String title = 'Flutter Todo';

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  
  List<Todo> _todoList;
  GlobalKey<ScaffoldState> _scaffoldKey;
  TextEditingController _todoController; // control TextField for to do
  Todo _selectedTodo;
  bool _isUpdating;
  String _titleProgress;

  @override
  void initState() {
    _todoList = [];
    _isUpdating = false;
    _titleProgress = widget.title;
    _scaffoldKey = GlobalKey(); // key to get context for SnackBar
    _todoController = TextEditingController();
  }

  _addTodo(){

  }

  _getTodo() {
    //
  }

  _updateTodo() {
    //
  }

  _deleteTodo() {}

  // clear TextField
  _clearValues() {
    _todoController.text = '';
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(_titleProgress),
        actions: <Widget> [
          IconButton(
            icon: Icon(Icons.add), 
            onPressed: (){
              // fetch
            })
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _todoController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Something To Do'),
              ),
            ),
            Row(
              children: <Widget> [
                OutlineButton(
                  child: Text('UPDATE'),
                  onPressed: () {
                    // update
                  } ),
                OutlineButton(
                  child: Text('CANCEL'),
                  onPressed: () {
                    // cancel
                  } )
              ],
            )
          ],
        ),
      ),
    );
  }
}
