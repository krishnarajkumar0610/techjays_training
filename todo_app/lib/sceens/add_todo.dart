import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddTodo extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isEdit = false;

  // This method is to post data
  Future<void> postData() async {
    final title = titleController.text;
    final description = descriptionController.text;
    final body = {'title': title, 'description': description};
    final response = await http.post(
        Uri.parse('https://api.nstack.in/v1/todos'),
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 201) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    }
  }

  // building UI
  @override
  Widget build(BuildContext context) {
    SizedBox space = const SizedBox(
      height: 30,
    );
    ElevatedButton button = ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 233, 218, 9)),
      onPressed: () {
        // Button onPressed logic
        postData();
      },
      child: const Text(
        'Submit',
        style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 233, 218, 9),
        title: Text(
          isEdit ? "Edit data" : "Submit data",
          style: const TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  hintText: "Title",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
            space,
            TextField(
              controller: descriptionController,
              maxLines: 5,
              decoration: InputDecoration(
                  hintText: "Description",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
            space,
            button
          ],
        ),
      ),
    );
  }
}
