import 'package:flutter/material.dart';
import 'package:todolist/widgets/todolist_item.dart';

import '../models/todo.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todoController = TextEditingController();

  List<Todo> todos = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: todoController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Adicione uma tarefa',
                              hintText: 'Ex. Estudar Flutter'),
                        ),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          String text = todoController.text;
                          setState(() {
                            Todo novoTodo = Todo(
                              title: text,
                              dateTime: DateTime.now(),
                            );
                            todos.add(novoTodo);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff00d7f3),
                          padding: EdgeInsets.all(14),
                        ),
                        child: Icon(
                          Icons.add,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Flexible( //Flexible não deixa o listview quebrar o limite da tela. Como se desse um overflow:hidden
                    child: ListView(
                      shrinkWrap: true,
                      //Ajusta dinamicamente o tamanho da view (do ListView). Cresce e aumenta conforme demanda. Como se fosse um heigth: auto e width: auto
                      children: [
                        for (Todo td in todos)
                          TodoListItem(todo: td,),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Text("Você possui ${todos.length} tarefas"),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      ElevatedButton(
                        onPressed: limpar,
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff00d7f3),
                          padding: EdgeInsets.all(14),
                        ),
                        child: Text("LimparTudo"),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
   void limpar() {
     todos.clear();
   }
}
