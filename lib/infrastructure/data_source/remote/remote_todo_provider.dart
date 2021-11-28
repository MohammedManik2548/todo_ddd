import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:todo_ddd/infrastructure/models/local/todo_item_model.dart';

abstract class RemoteTodoProvider {
  Future<void> addTodoItem({required TodoItemModel todoItem});

  Future<List<TodoItemModel>> getAllTodoItem();

  Future<TodoItemModel> getTodoItemById({required int id});

  Future<void> updateTodoItem(
      {required int id, required TodoItemModel todoItem});

  Future<void> deleteTodoItem({required int id});
}

class ApiTodoProviderImpl extends GetConnect implements RemoteTodoProvider{

  @override
  void onInit() {
    baseUrl= "https://flutterfly.prohelika.org/api/todoitems/";
    super.onInit();
  }

  @override
  Future<void> addTodoItem({required TodoItemModel todoItem}) {
    // TODO: implement addTodoItem
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTodoItem({required int id}) {
    // TODO: implement deleteTodoItem
    throw UnimplementedError();
  }

  @override
  Future<List<TodoItemModel>> getAllTodoItem() async{
    var response = await get("");

    print("${response.bodyString}");

    if(response.hasError){
      return Future.error(response.status);
    }else{
      return TodoItemModel.todoItemModelListFromJson(response.bodyString!);
    }
  }

  @override
  Future<TodoItemModel> getTodoItemById({required int id}) {
    // TODO: implement getTodoItemById
    throw UnimplementedError();
  }

  @override
  Future<void> updateTodoItem({required int id, required TodoItemModel todoItem}) {
    // TODO: implement updateTodoItem
    throw UnimplementedError();
  }

}

class FireBaseTodoProviderImpl implements RemoteTodoProvider{
  @override
  Future<void> addTodoItem({required TodoItemModel todoItem}) async{
    final DatabaseReference db = FirebaseDatabase().reference();

    db.child("todos").push().set(todoItem.toMap());

  }

  @override
  Future<void> deleteTodoItem({required int id}) {
    // TODO: implement deleteTodoItem
    throw UnimplementedError();
  }

  @override
  Future<List<TodoItemModel>> getAllTodoItem() async{
    List<TodoItemModel> todos=[];
    final DatabaseReference db = FirebaseDatabase().reference();
    var snapshot = await db.child('todos').get();
    var data = jsonDecode(jsonEncode(snapshot.value));
    data.forEach((key, value) {
      var todo= TodoItemModel.fromMap(value);
      todos.add(todo);
    });
    return todos;
  }

  @override
  Future<TodoItemModel> getTodoItemById({required int id}) {
    // TODO: implement getTodoItemById
    throw UnimplementedError();
  }

  @override
  Future<void> updateTodoItem({required int id, required TodoItemModel todoItem}) {
    // TODO: implement updateTodoItem
    throw UnimplementedError();
  }

}