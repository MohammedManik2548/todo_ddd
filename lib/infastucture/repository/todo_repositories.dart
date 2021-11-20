import 'package:get_storage/get_storage.dart';
import 'package:todo_ddd/domain/entities/entity.dart';
import 'package:todo_ddd/domain/repositories/repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final box = GetStorage();
  final todoKey = 'todos';

  @override
  Future<void> addTodoItem({required TodoItem todoItem}) async {
    return await box.write(todoKey, todoItem.toJson());
  }

  @override
  Future<void> deleteTodoItem({required int id}) async {
    return await box.remove(todoKey);
  }

  @override
  Future<List<TodoItem>> getAllTodoItem() async {
    List<TodoItem> todos = [];

    final boxTodo = await box.read(todoKey);

    if (boxTodo != null) {
      final todo = TodoItem.fromJson(boxTodo);

      todos.add(todo);
    }

    return todos;
  }

  @override
  Future<TodoItem> getTodoItemById({required int id}) {
    // TODO: implement getTodoItemById
    throw UnimplementedError();
  }

  @override
  Future<void> updateTodoItem({required int id, required TodoItem todoItem}) {
    // TODO: implement updateTodoItem
    throw UnimplementedError();
  }
}
