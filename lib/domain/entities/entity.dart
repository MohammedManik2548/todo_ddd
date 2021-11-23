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


}
