import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_flutter/bloc/todo_cubit.dart';
import 'package:try_flutter/loading_view.dart';

import 'models/Todo.dart';

class TodosView extends StatefulWidget {
  @override
  _TodosViewState createState() => _TodosViewState();
}

class _TodosViewState extends State<TodosView> {
  TextEditingController _todoController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _navbar(),
        floatingActionButton: _fab(),
        body: BlocBuilder<TodoCubit, TodoState>(builder: (context, state) {
          if (state is ListTodosSuccess) {
            return state.todos.isEmpty
                ? _emptyTodoView()
                : _todoListView(state.todos);
          } else if (state is ListTodosFailure) {
            return _exceptionView(state.exception);
          } else {
            return LoadingView();
          }
        }));
  }

  Widget _exceptionView(Exception exception) {
    return Center(
      child: Text(exception.toString()),
    );
  }

  AppBar _navbar() {
    return AppBar(
      title: Text("Todo App With AWS Amplify"),
    );
  }

  Widget _newTodoView() {
    return SizedBox(
      height: 200,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: TextFormField(
                  autofocus: true,
                  controller: _todoController,
                  decoration: InputDecoration(labelText: "Todo"),
                  validator: (val) {
                    if (val.isEmpty) {
                      return "Todo's title is required";
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      BlocProvider.of<TodoCubit>(context)
                          .createTodo(_todoController.text);

                      _todoController.text = "";
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text("Save"),
                  style: ButtonStyle(elevation: MaterialStateProperty.all(0)),
                ))
          ],
        ),
      ),
    );
  }

  FloatingActionButton _fab() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
            context: context, builder: (context) => _newTodoView());
      },
    );
  }

  Widget _emptyTodoView() {
    return Center(
      child: Text("No todo"),
    );
  }

  Widget _todoListView(List<Todo> todos) {
    return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          final todo = todos[index];
          return InkWell(
            onLongPress: () {
              BlocProvider.of<TodoCubit>(context).deleteTodo(todo);
            },
            child: Card(
              child: CheckboxListTile(
                title: Text(todo.title),
                value: todo.isComplete,
                onChanged: (newValue) {
                  BlocProvider.of<TodoCubit>(context)
                      .updateTodoIsComplete(todo, newValue);
                },
              ),
            ),
          );
        });
  }
}
