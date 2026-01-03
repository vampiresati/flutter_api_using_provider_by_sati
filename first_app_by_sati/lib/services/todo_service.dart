import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:first_app_by_sati/model/todo.dart';

class TodoService {
  Future<List<Todo>> getTodos() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/todos');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List todosJson = jsonDecode(response.body);
        return todosJson.map((json) => Todo.fromJson(json)).toList();
      } else {
        print('Error: ${response.statusCode} - ${response.reasonPhrase}');
        return [];
      }
    } catch (e) {
      print('Exception: $e');
      return [];
    }
  }
}
