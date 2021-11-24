import 'package:get/get.dart';
import 'package:todo_ddd/application/use_cases/delete_todo_use_case.dart';
import 'package:todo_ddd/application/use_cases/get_all_todo_use_case.dart';
import 'package:todo_ddd/application/use_cases/save_todo_use_case.dart';
import 'package:todo_ddd/application/use_cases/update_todo_use_case.dart';
import 'package:todo_ddd/domain/repositories/repository.dart';
import 'package:todo_ddd/infrastructure/data_source/local/local_todo_provider.dart';
import 'package:todo_ddd/infrastructure/data_source/remote/remote_todo_provider.dart';
import 'package:todo_ddd/infrastructure/repositories/todo_repository.dart';
import 'package:todo_ddd/presentation/controllers/edit_page_controller.dart';
import 'package:todo_ddd/presentation/controllers/my_home_page_controller.dart';

class AppBinding extends Bindings {
  final find = Get.find;
  @override
  void dependencies() {
    Get.lazyPut<LocalTodoProvider>(() => LocalTodoProviderImpl());
    Get.lazyPut<RemoteTodoProvider>(() => FireBaseTodoProvider());
    Get.lazyPut<TodoRepository>(() => TodoRepositoryImpl(find(),find()));
    Get.lazyPut(() => GetAllTodoUseCase(find()));
    Get.lazyPut(() => SaveTodoUseCase(find()));
    Get.lazyPut(() => DeleteTodoUseCase(find()));
    Get.lazyPut(() => UpdateTodoUseCase(find()));
    Get.lazyPut(() => MyHomePageController(find(), find(), find()));
    Get.lazyPut(() => MyEditPageController(find()));
  }
}
