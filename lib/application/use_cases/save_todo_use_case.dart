import 'package:todo_ddd/application/use_cases/base_use_case.dart';
import 'package:todo_ddd/domain/entities/entity.dart';
import 'package:todo_ddd/domain/repositories/repository.dart';

class SaveTodoUseCase implements BaseUseCase<void, TodoItem>{

  final TodoRepository _todoRepository;

  SaveTodoUseCase(this._todoRepository);

  @override
  Future<void> call(TodoItem request) {
    return _todoRepository.addTodoItem(todoItem: request);
  }

}