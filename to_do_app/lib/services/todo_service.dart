import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app/model/todo_model.dart';

class TodoService {
  final todoCollection = FirebaseFirestore.instance.collection('todoApp');

  //Create

  void addNewTask(TodoModel model) {
    todoCollection.add(model.toMap());
  }

  //Update

  void updateTask(String? docID, bool? valueUpdate) {
    todoCollection.doc(docID).update({
      'isDone': valueUpdate,
    });
  }

//Delete

  void deleteTask(String? docID) {
    todoCollection.doc(docID).delete();
  }


}
