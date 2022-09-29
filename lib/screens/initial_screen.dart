import 'package:aula_projeto_inicial/screens/form_screen.dart';
import 'package:flutter/material.dart';

import '../data/task_inherited.dart';

class InitialScreen extends StatefulWidget {
   InitialScreen({Key? key}) : super(key: key);

  double combinedLvls = 0;

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}
//TODO mudar cor das barras de lvl qndo upar e add uma barra de lvl geral junto ao Appbar abaixo do nome Task
class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tasks'),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        children: TaskInherited.of(context).taskList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                taskContext: context,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
