import 'package:todo_ddd/domain/entities/entity.dart';
import 'package:todo_ddd/domain/repositories/repository.dart';
import 'package:todo_ddd/infrastructure/data_source/local/local_todo_provider.dart';
import 'package:todo_ddd/infrastructure/data_source/remote/remote_todo_provider.dart';
import 'package:todo_ddd/infrastructure/models/local/todo_item_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  final LocalTodoProvider _localTodoProvider;
  final RemoteTodoProvider _remoteTodoProvider;

  TodoRepositoryImpl(
    this._localTodoProvider,
    this._remoteTodoProvider,
  );

  @override
  Future<void> addTodoItem({required TodoItem todoItem}) {
    var model = TodoItemModel(
      id: todoItem.id,
      name: todoItem.name,
      isComplete: todoItem.isComplete,
      createdAt: todoItem.createdAt,
    );
    return _remoteTodoProvider.addTodoItem(todoItem: model);
  }

  @override
  Future<void> deleteTodoItem({required int id}) {
    return _localTodoProvider.deleteTodoItem(id: id);
  }

  @override
  Future<List<TodoItem>> getAllTodoItem() {
    // return _localTodoProvider.getAllTodoItem();
    return _remoteTodoProvider.getAllTodoItem();
  }

  @override
  Future<TodoItem> getTodoItemById({required int id}) {
    return _localTodoProvider.getTodoItemById(id: id);
  }

  @override
  Future<void> updateTodoItem({required int id, required TodoItem todoItem}) {
    var model = TodoItemModel(
      id: todoItem.id,
      name: todoItem.name,
      isComplete: todoItem.isComplete,
      createdAt: todoItem.createdAt,
    );
    return _localTodoProvider.updateTodoItem(id: id, todoItem: model);
  }
}
