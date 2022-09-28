import 'package:aula_projeto_inicial/components/task.dart';
import 'package:aula_projeto_inicial/screens/form_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tasks'),
      ),
      body: ListView(
        children: const [
          Task('Learn Flutter',
              'assets/images/st,small,507x507-pad,600x600,f8f8f8.jpg', 5),
          Task('Play Bass', 'assets/images/new_bass_comp.jpg', 5),
          Task('Clean the House', 'assets/images/shutterstock_557357668.webp',
              3),
          Task(
              'Cook Lunch',
              'assets/images/chef-cooking-dinner-at-table-in-kitchen-vector-32060450.jpg',
              2),
          Task('Sleep',
              'assets/images/283fb478-5554-44aa-b37f-7917a90f38d7.jpg', 4),
          SizedBox(
            height: 80,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FormScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
