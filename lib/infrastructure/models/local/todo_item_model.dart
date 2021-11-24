import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:todo_ddd/domain/entities/entity.dart';

class TodoItemModel extends TodoItem {
  TodoItemModel(
      {required int id,
      required String name,
      required DateTime createdAt,
      bool isComplete = false})
      : super(
          id: id,
          name: name,
          isComplete: isComplete,
          createdAt: createdAt,
        );

  factory TodoItemModel.fromJson(String str) =>
      TodoItemModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TodoItemModel.fromMap(Map<String, dynamic> json) => TodoItemModel(
        id: json["id"],
        name: json["name"],
        isComplete: json["isComplete"],
        createdAt: DateTime.parse(json["createdAt"]),
      );
  factory TodoItemModel.fromSnapshot(DataSnapshot snapshot) => TodoItemModel(
        id: snapshot.value["id"],
        name: snapshot.value["name"],
        isComplete: snapshot.value["isComplete"],
        createdAt: DateTime.parse(snapshot.value["createdAt"]),
      );

  static List<TodoItemModel> todoItemModelListFromJson(String str) =>
      List<TodoItemModel>.from(
          json.decode(str).map((x) => TodoItemModel.fromMap(x)));

  static String todoItemModelListToJson(List<TodoItemModel> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "isComplete": isComplete,
        "createdAt": createdAt.toIso8601String(),
      };
}
