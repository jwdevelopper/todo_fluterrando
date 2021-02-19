import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_fluterrando/controllers/home_controller.dart';
import 'package:todo_fluterrando/models/todo_model.dart';
import 'package:todo_fluterrando/repositories/todo_repository.dart';

class TodoRepositoryMock extends Mock implements TodoRepository {
  
}

main() {
    final repository = TodoRepositoryMock();
    final controller = HomeController(repository);
    test('deve preencher variavel todos com lista', () async {
      when(repository.fetchTodos()).thenAnswer((_) async => [TodoModel()]);
      expect(controller.state,HomeState.start);
      await controller.start();
      expect(controller.state,HomeState.success);
      expect(controller.todos.isNotEmpty, true);
    });
}