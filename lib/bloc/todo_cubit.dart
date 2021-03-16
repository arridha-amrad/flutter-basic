import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_flutter/models/Todo.dart';
import 'package:try_flutter/repo/todo_repository.dart';

abstract class TodoState {}

class LoadingTodos extends TodoState {}

class ListTodosSuccess extends TodoState {
  final List<Todo> todos;
  ListTodosSuccess({this.todos});
}

class ListTodosFailure extends TodoState {
  final Exception exception;
  ListTodosFailure({this.exception});
}

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(LoadingTodos());

  final _todoRepo = TodoRepository();

  Future<void> getTodos() async {
    if (state is ListTodosSuccess == false) {
      emit(LoadingTodos());
    }
    try {
      final todos = await _todoRepo.getAllTodos();
      emit(ListTodosSuccess(todos: todos));
    } catch (e) {
      emit(ListTodosFailure(exception: e));
    }
  }

  Future<void> createTodo(String title) async {
    await _todoRepo.createTodo(title);
    await getTodos();
  }

  Future<void> updateTodoIsComplete(Todo todo, bool isComplete) async {
    await _todoRepo.updateTodoIsComplete(todo, isComplete);
    await getTodos();
  }

  Future<void> deleteTodo(Todo todo) async {
    await _todoRepo.deleteTodo(todo);
    await getTodos();
  }
}
