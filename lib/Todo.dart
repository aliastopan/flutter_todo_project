class Todo {
  int id;
  String todo;

  Todo({this.id, this.todo});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'] as int,
      todo: json['todo'] as String,
    );
  }
}
