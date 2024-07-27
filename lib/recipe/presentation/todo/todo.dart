import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

part 'todo.g.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    required int id,
    required String title,
    required bool isCompleted,
  }) = _Todo;

  factory Todo.fromJson(Map<String, Object?> json) => _$TodoFromJson(json);
}

class TodoRepository {
  Future<List<Todo>> getTodos() async {
    return [];
  }
}

class TodoViewModel with ChangeNotifier {
  final TodoRepository _todoRepository;

  List<Todo> _todos = [];

  List<Todo> get todos => List.unmodifiable(_todos);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  TodoViewModel(this._todoRepository);

  void fetchTodos() {}
}

class TodoScreen extends StatelessWidget {
  final TodoViewModel viewModel;

  const TodoScreen({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (BuildContext context, Widget? child) {
          return Column(
            children: [
              ElevatedButton(
                onPressed: () => viewModel.fetchTodos(),
                child: const Text('가져오기'),
              ),
              ...viewModel.todos.map((e) => Text(e.title)),
            ],
          );
        },
      ),
    );
  }
}

