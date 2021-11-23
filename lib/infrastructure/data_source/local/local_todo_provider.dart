import 'package:get_storage/get_storage.dart';
import 'package:todo_ddd/infrastructure/models/local/todo_item_model.dart';

abstract class LocalTodoProvider {
  Future<void> addTodoItem({required TodoItemModel todoItem});

  Future<List<TodoItemModel>> getAllTodoItem();

  Future<TodoItemModel> getTodoItemById({required int id});

  Future<void> updateTodoItem(
      {required int id, required TodoItemModel todoItem});

  Future<void> deleteTodoItem({required int id});
}

class LocalTodoProviderImpl implements LocalTodoProvider {
  final GetStorage _storage;

  final String _todoKey = "todo";

  LocalTodoProviderImpl() : _storage = GetStorage();

  @override
  Future<void> addTodoItem({required TodoItemModel todoItem}) async {
    var todoItemList = await getAllTodoItem();

    todoItemList.add(todoItem);
    await _storage.write(
        _todoKey, TodoItemModel.todoItemModelListToJson(todoItemList));
  }

  @override
  Future<void> deleteTodoItem({required int id}) async {
    var todoItemList = await getAllTodoItem();

    todoItemList.removeWhere((element) => element.id == id);
    await _storage.write(
        _todoKey, TodoItemModel.todoItemModelListToJson(todoItemList));
  }

  @override
  Future<List<TodoItemModel>> getAllTodoItem() async {
    var todoStr = await _storage.read(_todoKey);

    List<TodoItemModel> list = [];

    if (todoStr != null) {
      var newList = TodoItemModel.todoItemModelListFromJson(todoStr);

      list.addAll(newList);
    }
    return list;
  }

  @override
  Future<TodoItemModel> getTodoItemById({required int id}) async {
    var todoItemList = await getAllTodoItem();

    var todo = todoItemList.where((element) => element.id == id).toList().first;

    return todo;
  }

  @override
  Future<void> updateTodoItem(
      {required int id, required TodoItemModel todoItem}) async {
    var todoItemList = await getAllTodoItem();

    var index = todoItemList.indexWhere((element) => element.id == id);

    todoItemList.removeWhere((element) => element.id == id);

    todoItemList.insert(index, todoItem);

    await _storage.write(
        _todoKey, TodoItemModel.todoItemModelListToJson(todoItemList));
  }
}
