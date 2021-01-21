import 'package:flutter/material.dart';
import 'Todo.dart';
import 'ServicesOld.dart';

class TodoPageOld extends StatefulWidget {
  TodoPageOld() : super();
  final String title = 'Flutter Todo';

  @override
  _TodoPageOldState createState() => _TodoPageOldState();
}

class _TodoPageOldState extends State<TodoPageOld> {
  List<Todo> _todos;
  GlobalKey<ScaffoldState> _scaffoldKey;
  TextEditingController _todoController; // control TextField for to do

  Todo _selectedTodo;
  bool _isUpdating;
  String _titleProgress;

  @override
  void initState() {
    _todos = [];
    _isUpdating = false;
    _titleProgress = widget.title;
    _scaffoldKey = GlobalKey(); // key to get context for SnackBar
    _todoController = TextEditingController();
  }

  //update title in the AppBar Title
  _showProgress(String message) {
    setState(() {
      _titleProgress = message;
    });
  }

  _showSnackBar(context, message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  _addTodo() {
    if (_todoController.text.isEmpty) {
      print('Empty Field');
      return;
    }
    _showProgress('Adding Task...');
    ServicesOld.addTodo(_todoController.text).then((result) {
      if ('success' == result) {
        //
      }
      _clearValues();
    });
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

  // UI

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(_titleProgress),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _getTodo();
              })
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _todoController,
                decoration: InputDecoration.collapsed(hintText: 'To Do'),
              ),
            ),
            // add update button
            // show only when updating
            _isUpdating
                ? Row(
                    children: <Widget>[
                      OutlineButton(
                          child: Text('UPDATE'),
                          onPressed: () {
                            _updateTodo();
                          }),
                      OutlineButton(
                          child: Text('CANCEL'),
                          onPressed: () {
                            setState(() {
                              _isUpdating = false;
                            });
                            _clearValues();
                          }),
                    ],
                  )
                : Container()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTodo();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
