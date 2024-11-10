import 'package:flutter/material.dart';

class ToDoListScreen extends StatefulWidget {
  @override
  _ToDoListScreenState createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  // Sample task data
  List<Map<String, dynamic>> tasks = [
    {'task': 'Buy groceries', 'isCompleted': false},
    {'task': 'Walk the dog', 'isCompleted': true},
    {'task': 'Finish homework', 'isCompleted': false},
    {'task': 'Clean the house', 'isCompleted': true},
  ];

  // Function to toggle task completion
  void toggleTaskCompletion(int index) {
    setState(() {
      tasks[index]['isCompleted'] = !tasks[index]['isCompleted'];
    });
  }

  @override
  Widget build(BuildContext context) {
    // Separate completed and incomplete tasks
    List<Map<String, dynamic>> completedTasks = tasks.where((task) => task['isCompleted']).toList();
    List<Map<String, dynamic>> incompleteTasks = tasks.where((task) => !task['isCompleted']).toList();

    return Scaffold(
      appBar: AppBar(
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: Text('All'),
              onPressed: () {
              },
            ),
           ElevatedButton(
              child: Text('Workplace'),
              onPressed: () {
              },
            ),ElevatedButton(
              child: Text('Personal'),
              onPressed: () {
              },
            ),ElevatedButton(
              child: Text('Wishlist'),
              onPressed: () {
              },
            ), 
          ]
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Incomplete Tasks',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                ...incompleteTasks.map((task) {
                  int index = tasks.indexOf(task);
                  return ListTile(
                    title: Text(task['task']),
                    trailing: IconButton(
                      icon: Icon(Icons.check_box_outline_blank),
                      onPressed: () => toggleTaskCompletion(index),
                    ),
                  );
                }).toList(),
                
                // Completed tasks section
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Completed Tasks',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                ...completedTasks.map((task) {
                  int index = tasks.indexOf(task);
                  return ListTile(
                    title: Text(task['task']),
                    trailing: IconButton(
                      icon: Icon(Icons.check_box),
                      onPressed: () => toggleTaskCompletion(index),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}