import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/bloc/todo_bloc.dart';
import 'package:todo_bloc/bloc/todo_event.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  // ignore: non_constant_identifier_names
  TextEditingController title_state = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController description_state = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "ADDING DATA PAGE",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ignore: prefer_const_constructors
              SizedBox(
                  height: 100,
                  width: 300,
                  // ignore: prefer_const_constructors
                  child: TextField(
                    controller: title_state,
                    decoration: const InputDecoration(hintText: "TITLE"),
                  )),
              // ignore: prefer_const_constructors
              SizedBox(
                  height: 100,
                  width: 300,
                  // ignore: prefer_const_constructors
                  child: TextField(
                    controller: description_state,
                    decoration: const InputDecoration(hintText: "DESCRIPTION"),
                  )),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple),
                      onPressed: () {
                        print("Button Pressed");
                        context.read<TodoBloc>().add(AddEvent(
                            title: title_state.text,
                            description: description_state.text));
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "SUBMIT",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      )))
            ],
          ),
        ),
      );
  }
}
