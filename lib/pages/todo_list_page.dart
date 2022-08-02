import 'package:flutter/material.dart';
import 'package:todolist/widgets/todo_list_item.dart';

// class TodoListPage extends StatelessWidget {
//   TodoListPage({Key? key}) : super(key: key);
//
//   final TextEditingController emailController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                   labelText: "E-mail",
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: login,
//                 child: Text("Entrar"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void login() {
//     String text = emailController.text;
//     print(text);
//     emailController.clear();
//   }
// }

class TodoListPage extends StatefulWidget {
  TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todoController = TextEditingController();

  List<String> todos = [];

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
                            todos.add(text);
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
                        for (String todo in todos)
                          TodoListItem(title: todo,),
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
                        onPressed: () {},
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
}
