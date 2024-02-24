class TodoEvent {}

class AddEvent extends TodoEvent {
  String? title;
  String? description;
  AddEvent({this.title, this.description});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
    };
  }
}

class GetEvent extends TodoEvent {}
