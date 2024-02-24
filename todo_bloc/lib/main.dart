import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/bloc/todo_bloc.dart';
import 'package:todo_bloc/bloc/todo_event.dart';
import 'package:todo_bloc/bloc/todo_state.dart';

import 'package:todo_bloc/screens/add_list.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => TodoBloc(),
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          // ignore: prefer_const_constructors
          home: MyApp(),
        )
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final object = TodoBloc();
  bool loading = true;
  @override
  void initState() {
    super.initState();

    object.add(GetEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              BlocConsumer<TodoBloc, DataState>(
                bloc: object,
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  print(state.users);
                  List<Map<String,dynamic>> items = state.users?['items'];
                  return Container(
                    width: 350,
                    height: 600,
                    decoration: const BoxDecoration(color: Colors.deepPurple),
                    child: ListView.builder(
                      itemCount: items.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final data = items[index];

                        return ListTile(
                          title: data?['title'],
                          subtitle: data?['description'],
                        );
                      },
                    ),
                  );
                },
              )],
          ),
        ),
           floatingActionButton: FloatingActionButton.extended(
             backgroundColor: Colors.deepPurple,
             icon: const Icon(
               Icons.add,
               color: Colors.black,
               size: 30,
             ),
             onPressed: () async {
               await Navigator.push(context,
                   MaterialPageRoute(builder: (context) => AddData()));
             },
             label: const Text(
               "Add Data",
               style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 20,
                   color: Colors.black),
             ),
           ),
      ),
    );
  }
}
