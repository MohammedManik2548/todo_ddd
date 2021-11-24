class TodoItem {
  TodoItem({
    required this.id,
    required this.name,
    required this.createdAt,
    this.isComplete=false,
  });

  int id;
  String name;
  bool isComplete;
  DateTime createdAt;

  TodoItem copyWith({
    int? id,
    String? name,
    bool? isComplete,
    DateTime? createdAt,
  }) =>
      TodoItem(
        id: id ?? this.id,
        name: name ?? this.name,
        isComplete: isComplete ?? this.isComplete,
        createdAt: createdAt ?? this.createdAt,
      );


}
