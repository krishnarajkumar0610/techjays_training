import 'package:flutter/material.dart';
import 'package:todo_app/sceens/todo_list.dart';



void main() {
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, // debug banner will not visible
        theme: ThemeData.dark(), // dark theme
        home: const SafeArea(child: Scaffold(body: TodoList())));
  }
}
