import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/sceens/add_todo.dart';



class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List items = []; // creating an empty list
  bool loading = true; // assigning loading as true

  @override
  void initState() {
    // when initState() is seen in the state it automatically calls
    super.initState(); // calling super class method
    getData(); // Then to get fetch data it calls getData() method
  }

  // This method is to get data from the server
  Future<void> getData() async {
    setState(() {
      // when the getData() method is called then assgning loading as true so we can see auto loading visually
      loading = true;
    });

    // This URL will helps to fetch data from server
    final response = await http
        .get(Uri.parse('https://api.nstack.in/v1/todos?page=1&limit=15'));
    if (response.statusCode == 200) {
      // getting json body and store it in an variable
      dynamic jsonBody = jsonDecode(response.body);
      // taking particular item but it contains a list of sets and store it in same variable because it is dynamic
      jsonBody = jsonBody['items'];
      setState(() {
        // then assigning it to the items variable to display to user
        items = jsonBody;
      });
    }
    // After fetching the data from the server the loading mus be stop so assigning loading as false. So i stops the loadin
    setState(() {
      loading = false;
    });
  }

  // This method is to delete data from the server
  Future<void> deleteData(String id) async {
    //This URL is helps to delete data from the server
    final response =
        await http.delete(Uri.parse('https://api.nstack.in/v1/todos/$id'));

    // if the data is deleted from the server then the status code is 200
    if (response.statusCode == 200) {
      setState(() {
        // Then removing it from the list because it will display the deleted data also
        items = items.where((element) => element['_id'] != id).toList();
      });
    }

    //Sometimes there may cause some issues in server then we can't delete it so display it as a dialog box
    else {
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: const Text("Technical error"),
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Close"))
              ],
            );
          });
    }
  }

  // This method is for updating the data
  void updateData(Map items) async {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Todo App",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 233, 218, 9),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(30)),
            height: 600,
            width: 500,
            child: Visibility(
              visible: loading,
              replacement: RefreshIndicator(
                onRefresh: getData,
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index] as Map;
                    final id = item['_id'] as String;
                    return ListTile(
                      leading: CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 233, 218, 9),
                          child: Text(
                            "${index + 1}",
                            style: const TextStyle(color: Colors.black),
                          )),
                      title: Text(
                        "Name :" + item['title'],
                        style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                      subtitle: Text(
                        "Role :" + item['description'],
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      trailing: PopupMenuButton(
                        onSelected: (value) {
                          if (value == "Edit") {
                            updateData(item);
                          } else if (value == "Delete") {
                            deleteData(id);
                          }
                        },
                        itemBuilder: (context) {
                          return [
                            const PopupMenuItem(
                              value: "Edit",
                              child: Text("Edit"),
                            ),
                            const PopupMenuItem(
                              value: "Delete",
                              child: Text("Delete"),
                            )
                          ];
                        },
                      ),
                    );
                  },
                ),
              ),
              child: const Center(
                child: CircularProgressIndicator(color: Colors.yellow),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: const Color.fromARGB(255, 233, 218, 9),
          icon: const Icon(
            Icons.add,
            color: Colors.black,
            size: 30,
          ),
          label: const Text(
            "Add Data",
            style: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          onPressed: () async {
            await Navigator.push(
                // I used await to wait to push data and it return as Future
                context,
                MaterialPageRoute(builder: (context) => AddTodo()));
            // after inseting a  data need to fetch all datas to display to user so calling the getData() method
            getData();
          },
        ),
      ),
    );
  }
}
