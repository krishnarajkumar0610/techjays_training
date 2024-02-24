import 'dart:convert';

class PaginatedResponse {
  int code;
  bool success;
  int timestamp;
  String message;
  List<TodoItem> items;
  Meta meta;

  PaginatedResponse({
    required this.code,
    required this.success,
    required this.timestamp,
    required this.message,
    required this.items,
    required this.meta,
  });

  // Convert the PaginatedResponse object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'success': success,
      'timestamp': timestamp,
      'message': message,
      'items': items.map((item) => item.toJson()).toList(),
      'meta': meta.toJson(),
    };
  }

  // Create a PaginatedResponse object from a JSON map
  factory PaginatedResponse.fromJson(Map<String, dynamic> json) {
    return PaginatedResponse(
      code: json['code'],
      success: json['success'],
      timestamp: json['timestamp'],
      message: json['message'],
      items: List<TodoItem>.from(json['items'].map((item) => TodoItem.fromJson(item))),
      meta: Meta.fromJson(json['meta']),
    );
  }
}

class TodoItem {
  String id;
  String title;
  String description;
  bool isCompleted;
  DateTime createdAt;
  DateTime updatedAt;

  TodoItem({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.createdAt,
    required this.updatedAt,
  });

  // Convert the TodoItem object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'is_completed': isCompleted,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  // Create a TodoItem object from a JSON map
  factory TodoItem.fromJson(Map<String, dynamic> json) {
    return TodoItem(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      isCompleted: json['is_completed'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

class Meta {
  int totalItems;
  int totalPages;
  int perPageItem;
  int currentPage;
  int pageSize;
  bool hasMorePage;

  Meta({
    required this.totalItems,
    required this.totalPages,
    required this.perPageItem,
    required this.currentPage,
    required this.pageSize,
    required this.hasMorePage,
  });

  // Convert the Meta object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'total_items': totalItems,
      'total_pages': totalPages,
      'per_page_item': perPageItem,
      'current_page': currentPage,
      'page_size': pageSize,
      'has_more_page': hasMorePage,
    };
  }

  // Create a Meta object from a JSON map
  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      totalItems: json['total_items'],
      totalPages: json['total_pages'],
      perPageItem: json['per_page_item'],
      currentPage: json['current_page'],
      pageSize: json['page_size'],
      hasMorePage: json['has_more_page'],
    );
  }
}
