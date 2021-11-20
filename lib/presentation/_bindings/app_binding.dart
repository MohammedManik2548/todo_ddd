import 'package:get/get.dart';
import 'package:todo_ddd/application/use_cases/delete_todo_use_case.dart';
import 'package:todo_ddd/application/use_cases/get_all_todo_use_case.dart';
import 'package:todo_ddd/application/use_cases/save_todo_use_case.dart';
import 'package:todo_ddd/application/use_cases/update_todo_use_case.dart';
import 'package:todo_ddd/domain/repositories/repository.dart';
import 'package:todo_ddd/infastucture/repository/todo_repositories.dart';
import 'package:todo_ddd/presentation/controllers/my_home_page_controller.dart';

class AppBinding extends Bindings {
  final find = Get.find;
  @override
  void dependencies() {
    Get.lazyPut<TodoRepository>(() => TodoRepositoryImpl());
    Get.lazyReplace(() => GetAllTodoUseCase(find()));
    Get.lazyPut(() => SaveTodoUseCase(find()));
    Get.lazyPut(() => DeleteTodoUseCase(find()));
    Get.lazyPut(() => UpdateTodoUseCase(find()));
    Get.lazyPut(() => MyHomePageController(find(), find(), find()));
  }
}
