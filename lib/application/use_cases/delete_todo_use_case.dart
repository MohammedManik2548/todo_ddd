import 'package:todo_ddd/application/use_cases/base_use_case.dart';
import 'package:todo_ddd/domain/entities/entity.dart';
import 'package:todo_ddd/domain/repositories/repository.dart';

class DeleteTodoUseCase implements BaseUseCase<List<TodoItem>, int>{
  final TodoRepository _todoRepository;

  DeleteTodoUseCase(this._todoRepository);

  @override
  Future<List<TodoItem>> call(int request) async{
    await _todoRepository.deleteTodoItem(id: request);

    return _todoRepository.getAllTodoItem();
  }

}