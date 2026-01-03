import 'package:first_app_by_sati/services/todo_service.dart';
import 'package:flutter/material.dart';
import 'package:first_app_by_sati/model/todo.dart';

class TodoProvider extends ChangeNotifier {
  bool _isLoading = false;
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;
  final TodoService _todoService = TodoService();
  Future<void> getTodos() async {
    _isLoading = true;
    notifyListeners();
    _todos = await _todoService.getTodos();
    _isLoading = false;
    notifyListeners();
  }
}
