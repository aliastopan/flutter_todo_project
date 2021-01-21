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
    _getTodo();
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
    _showProgress('Adding...');
    Services.addTodo(_todoController.text).then((result) {
      if ('success' == result) {
        _getTodo(); // refresh after update
        _clearTextField();
      }
    });
  }

  _getTodo() {
    _showProgress('Loading...');

    Services.getTodo().then((todos) {
      setState(() {
        _todoList = todos;
        print("Length ${_todoList.length}");
      });
    });
    _showProgress(widget.title); // reset title
  }

  _updateTodo(Todo todo) {
    setState(() {
      _isUpdating = true;
    });

    _showProgress('Updating...');
    Services.updateTodo(todo.id, _todoController.text).then((result) {
      if ('success' == result) {
        _getTodo(); // refresh after update
        _isUpdating = false;
      }
    });
    _clearTextField();
  }

  _deleteTodo(Todo todo) {
    _showProgress('Deleting...');
    Services.deleteTodo(todo.id).then((result) {
      if ('success' == result) {
        _getTodo();
      }
    });
    _clearTextField();
  }

  // clear TextField
  _clearTextField() {
    _todoController.text = '';
  }

  _populateTextField(Todo todo) {
    _todoController.text = todo.todo;
  }

  SingleChildScrollView _dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('TO DO'))
          ],
          rows: _todoList
              .map((todo) => DataRow(cells: [
                    DataCell(
                      Text(todo.id),
                      onTap: () {
                        _populateTextField(todo);
                      },
                    ),
                    DataCell(
                      Text(todo.todo),
                      onTap: () {
                        _populateTextField(todo);
                      },
                    ),
                  ]))
              .toList(),
        ),
      ),
    );
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
              icon: Icon(Icons.add),
              onPressed: () {
                // fetch
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
                decoration:
                    InputDecoration.collapsed(hintText: 'Something To Do'),
              ),
            ),
            _isUpdating ? updateAndCancel() : Container(),
            Expanded(
              child: _dataBody(),
            ),
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

  Widget updateAndCancel() {
    return Row(
      children: <Widget>[
        OutlineButton(
            child: Text('UPDATE'),
            onPressed: () {
              // update
            }),
        OutlineButton(
            child: Text('CANCEL'),
            onPressed: () {
              setState(() {
                _isUpdating = false;
              });
              _clearTextField();
            })
      ],
    );
  }
}
