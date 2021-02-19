import 'package:flutter/cupertino.dart';
import 'package:todo_fluterrando/models/todo_model.dart';
import 'package:todo_fluterrando/repositories/todo_repository.dart';

class HomeController {

  List<TodoModel> todos = [];

  final state = ValueNotifier<HomeState>(HomeState.start);

  

  final TodoRepository _repository;

  HomeController([TodoRepository repository]) : _repository = repository ?? TodoRepository();
  
  Future start() async {
    state.value  = HomeState.loading;
    try{
      todos = await _repository.fetchTodos();
      state.value  = HomeState.success;
    } catch(e) {
      state.value  = HomeState.error;
    } 
  }
  
}

enum HomeState { start, loading, success, error}