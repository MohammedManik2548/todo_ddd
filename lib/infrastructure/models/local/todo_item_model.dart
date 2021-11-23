import 'dart:convert';

import 'package:todo_ddd/domain/entities/entity.dart';

class TodoItemModel extends TodoItem {
  TodoItemModel(
      {required int id, required String description, bool isCompleted = false})
      : super(
          id: id,
          description: description,
          isCompleted: isCompleted,
        );

  factory TodoItemModel.fromJson(String str) =>
      TodoItemModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TodoItemModel.fromMap(Map<String, dynamic> json) => TodoItemModel(
        id: json["id"],
        description: json["description"],
        isCompleted: json["isCompleted"],
      );

  static List<TodoItemModel> todoItemModelListFromJson(String str) =>
      List<TodoItemModel>.from(
          json.decode(str).map((x) => TodoItemModel.fromJson(x)));

  static String todoItemModelListToJson(List<TodoItemModel> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  Map<String, dynamic> toMap() => {
        "id": id,
        "description": description,
        "isCompleted": isCompleted,
      };
}
