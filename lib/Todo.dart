class Todo {
  String id;
  String todo;

  Todo({this.id, this.todo});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'] as String,
      todo: json['to_do'] as String,
    );
  }
}
