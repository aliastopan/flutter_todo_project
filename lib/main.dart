import 'package:flutter/material.dart';
import 'package:sampleproject/TodoPage.dart';
import 'TodoPage.dart';
import 'Services.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: TodoPage(), //MyApp() / TodoPage()
        ),
      ),
    ),
  );
}
