import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:to_do_app/common/show_model.dart';
import 'package:to_do_app/provider/service_provider.dart';
import 'package:to_do_app/widget/card_todo_widget.dart';
// import 'package:to_do_app/widget/add_new_task_model.dart'; // Import AddNewTaskModel

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  // Create instances of TextEditingController for title and description
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoData = ref.watch(fetchStreamProvider);
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: ListTile(
            leading: CircleAvatar(
              radius: 25,
              child: Image.asset('assets/a.png'),
            ),
            title: Text(
              'Hello I\'m ',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
            subtitle: Text(
              'Ilkin Babashov',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.calendar_month)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
                ],
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Today's Task",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text('Wednsday, 13 March',
                          style: TextStyle(color: Colors.grey))
                    ],
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD5E8FA),
                          foregroundColor: Colors.blue.shade800,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () => showModalBottomSheet(
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          context: context,
                          builder: (context) => AddNewTaskModel(
                                titleController: titleController,
                                descriptionController: descriptionController,
                              )),
                      child: const Text('+ New Task')),
                ],
              ),

              //Card list task
              const Gap(20),
              ListView.builder(
                  itemCount: todoData.value?.length ??
                      0, // Using null-aware operator and null coalescing operator
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      CardTodoListWidget(getIndex: index))
            ],

            // ListView.builder(
            //       itemCount: todoData.value!.length,
            //       shrinkWrap: true,
            //       itemBuilder: (context, index) =>
            //           CardTodoListWidget(getIndex: index))

          ),
        )));
  }
}
