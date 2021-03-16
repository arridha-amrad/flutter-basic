import 'package:amplify_flutter/amplify.dart';
import 'package:try_flutter/models/Todo.dart';

class TodoRepository {
  Future<List<Todo>> getAllTodos() async {
    try {
      var todos = await Amplify.DataStore.query(Todo.classType);
      return todos;
    } catch (e) {
      throw e;
    }
  }

  Future<void> createTodo(String title) async {
    final newTodo = Todo(title: title, isComplete: false);
    try {
      await Amplify.DataStore.save(newTodo);
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateTodoIsComplete(Todo todo, bool isComplete) async {
    final updatedTodo = todo.copyWith(isComplete: isComplete);
    try {
      await Amplify.DataStore.save(updatedTodo);
    } catch (e) {
      throw e;
    }
  }

  Future<void> deleteTodo(Todo todo) async {
    try {
      await Amplify.DataStore.delete(todo);
    } catch (e) {
      throw e;
    }
  }
}
