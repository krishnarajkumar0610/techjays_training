import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/bloc/todo_event.dart';
import 'package:todo_bloc/bloc/todo_state.dart';
import 'package:http/http.dart' as http;

import '../model/items.dart';

class TodoBloc extends Bloc<TodoEvent, DataState> {
  String title = "title";
  String description = "description";
  TodoBloc() : super(DataState()) {
    on<AddEvent>((event, emit) async {

      final body = event.toJson();
      final response = await http.post(
          Uri.parse("https://api.nstack.in/v1/todos"),
          body: jsonEncode(body),
          headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 201) {
        print("Success");
      }
    });

    on<GetEvent>((event, emit) async {
      final response = await http.get(Uri.parse("https://api.nstack.in/v1/todos?page=1&limit=5"));
      if (response.statusCode == 200) {
        final datas = jsonDecode(response.body);
        final items = Item.fromJson(datas['items']);
        print(items);
        emit(DataState(users: datas));
        print("Get datas");
      }
    });
  }
}
