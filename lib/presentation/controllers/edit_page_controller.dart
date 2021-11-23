import 'package:get/get.dart';
import 'package:todo_ddd/application/use_cases/update_todo_use_case.dart';
import 'package:todo_ddd/domain/entities/entity.dart';
import 'package:todo_ddd/presentation/controllers/my_home_page_controller.dart';

class MyEditPageController extends GetxController {
  final UpdateTodoUseCase _updateTodoUseCase;

  final id = 0.obs;

  final description = ''.obs;
  final isCompleted = false.obs;

  MyEditPageController(this._updateTodoUseCase);

  updateTodo() async {
    final response = await _updateTodoUseCase.call(TodoItem(
      id: id.value,
      description: description.value,
      isCompleted: isCompleted.value,
    ));

    final homePageController = Get.find<MyHomePageController>();
    homePageController.todos.assignAll(response);
  }

  @override
  void onInit() {
    super.onInit();

    final todo = Get.arguments as TodoItem;

    id.value = todo.id;
    description.value = todo.description;
    isCompleted.value = todo.isCompleted;
  }
}
