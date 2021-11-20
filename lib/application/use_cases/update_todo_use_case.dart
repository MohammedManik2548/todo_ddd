import 'package:todo_ddd/application/use_cases/base_use_case.dart';
import 'package:todo_ddd/domain/entities/entity.dart';
import 'package:todo_ddd/domain/repositories/repository.dart';

class UpdateTodoUseCase implements BaseUseCase<List<TodoItem>, TodoItem>{
  final TodoRepository _todoRepository;

  UpdateTodoUseCase(this._todoRepository);

  @override
  Future<List<TodoItem>> call(TodoItem request)async {
    await _todoRepository.updateTodoItem(id: request.id, todoItem: request);
    
    return _todoRepository.getAllTodoItem();
  }

}