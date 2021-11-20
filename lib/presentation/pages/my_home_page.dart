import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:todo_ddd/presentation/controllers/my_home_page_controller.dart';

class MyHomePage extends GetView<MyHomePageController> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
      ),
      body: Container(
        child: Column(
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    onSaved: (value) {
                      controller.id.value = int.parse(value!);
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter Id',
                    ),
                  ),
                  TextFormField(
                    onSaved: (value) {
                      controller.description.value = value!;
                    },
                    decoration: InputDecoration(labelText: 'Enter Description'),
                  ),
                  ElevatedButton(
                    onPressed: () async{
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        await controller.saveTodo();
                        await controller.getTodos();
                      }
                    },
                    child: Text('Save'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.todos.length,
                  itemBuilder: (context, index) {
                    final todo = controller.todos[index];
                    return ListTile(
                      leading: Text('${todo.id}'),
                      title: Text('${todo.description}'),
                      selected: todo.isCompleted,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
