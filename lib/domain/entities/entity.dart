import 'dart:convert';

class TodoItem {
  TodoItem({
    required this.id,
    required this.description,
    this.isCompleted=false,
  });

  int id;
  String description;
  bool isCompleted;

  TodoItem copyWith({
    int? id,
    String? description,
    bool? isCompleted,
  }) =>
      TodoItem(
        id: id ?? this.id,
        description: description ?? this.description,
        isCompleted: isCompleted ?? this.isCompleted,
      );

  factory TodoItem.fromJson(String str) => TodoItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TodoItem.fromMap(Map<String, dynamic> json) => TodoItem(
    id: json["id"],
    description: json["description"],
    isCompleted: json["isCompleted"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "description": description,
    "isCompleted": isCompleted,
  };
}
