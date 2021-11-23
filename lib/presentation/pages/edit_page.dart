import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_ddd/presentation/controllers/edit_page_controller.dart';

class MyEditPage extends GetView<MyEditPageController> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit'),
      ),
      body: Form(
        key: formKey,
        child: Obx(
          () => Column(
            children: [
              TextFormField(
                initialValue: controller.id.value.toString(),
                onSaved: (value) {
                  controller.id.value = int.parse(value!);
                },
                decoration: InputDecoration(labelText: "Enter Id"),
              ),
              TextFormField(
                initialValue: controller.description.value.toString(),
                onSaved: (value) {
                  controller.description.value = value!;
                },
                decoration: InputDecoration(labelText: "Enter Description"),
              ),
              Row(
                children: [
                  Text('Completed: '),
                  Switch(
                    value: controller.isCompleted.value,
                    onChanged: (bool value) {
                      controller.isCompleted.value = value;
                    },
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      await controller.updateTodo();

                      Get.back();
                    }
                  },
                  child: Text('Update'))
            ],
          ),
        ),
      ),
    );
  }
}
