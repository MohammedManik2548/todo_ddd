import 'package:todo_ddd/application/dtos/request/empty_request.dart';
import 'package:todo_ddd/application/use_cases/base_use_case.dart';
import 'package:todo_ddd/domain/entities/entity.dart';
import 'package:todo_ddd/domain/repositories/repository.dart';

class GetAllTodoUseCase implements BaseUseCase<List<TodoItem>, EmptyRequest>{

  final TodoRepository _todoRepository;

  GetAllTodoUseCase(this._todoRepository);

  @override
  Future<List<TodoItem>> call(EmptyRequest request) {
    return _todoRepository.getAllTodoItem();
  }

}