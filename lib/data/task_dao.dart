import 'package:aula_projeto_inicial/components/task.dart';
import 'package:aula_projeto_inicial/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT), ';

  static const String _tableName = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';


  save(Task task) async {
    print('Initializing save: ');
    final Database database = await getDatabase();
    var itemExists = await find(task.name);
    Map<String, dynamic> taskMap = toMap(task);
    if (itemExists.isEmpty) {
      print('Task did not exist.');
      return await database.insert(
        _tableName,
        taskMap,
      );
    } else {
      print('Task already exist!');
      return await database.update(
        _tableName,
        taskMap,
        where: '$_name = ?',
        whereArgs: [task.name],
      );
    }
  }

  Map<String, dynamic> toMap(Task task) {
    print('Converting Task to Map: ');
    final Map<String, dynamic> mapOfTasks = Map();
    mapOfTasks[_name] = task.name;
    mapOfTasks[_difficulty] = task.difficulty;
    mapOfTasks[_image] = task.image;
    print('Map of Tasks: $mapOfTasks');
    return mapOfTasks;
  }

  Future<List<Task>> findAll() async {
    print('Accessing findAll: ');
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(_tableName);
    print('Searching data on database... found: $result');
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> tasksMap) {
    print('Converting to List:');
    final List<Task> tasks = [];
    for (Map<String, dynamic> line in tasksMap) {
      final Task task = Task(line[_name], line[_image], line[_difficulty]);
      tasks.add(task);
    }
    print('Tasks List $tasks');
    return tasks;
  }

  Future<List<Task>> find(String taskName) async {
    print('Accessing find: ');
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(
      _tableName,
      where: '$_name = ?',
      whereArgs: [taskName],
    );
    print('Task founded: ${toList(result)}');
    return toList(result);
  }

  delete(String taskName) async {
    print('Deleting a task: $taskName');
    final Database database = await getDatabase();
    return database.delete(
      _tableName,
      where: '$_name = ?',
      whereArgs: [taskName],
    );
  }
}
