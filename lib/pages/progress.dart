import 'package:flutter/material.dart';

class ProgressPage extends StatefulWidget {
  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  // Sample tasks with completion status
  List<Map<String, dynamic>> tasks = [
    {'task': 'Buy Groceries', 'isCompleted': true},
    {'task': 'Finish Homework', 'isCompleted': false},
    {'task': 'Call John', 'isCompleted': true},
    {'task': 'Write Flutter Code', 'isCompleted': false},
  ];

  double _progress = 0.0;

  // Calculate the progress based on the completed tasks
  void _calculateProgress() {
    int completedTasks = tasks.where((task) => task['isCompleted']).toList().length;
    setState(() {
      _progress = completedTasks / tasks.length;
    });
  }

  @override
  void initState() {
    super.initState();
    _calculateProgress(); // Calculate progress when the page is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Completion Progress'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Task Completion Status',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Display the progress bar
            LinearProgressIndicator(
              value: _progress,
              minHeight: 10,
              backgroundColor: Colors.grey[300],
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            Text(
              '${(_progress * 100).toStringAsFixed(0)}% Complete',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            // Display the task list with checkboxes
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tasks[index]['task']),
                    trailing: Checkbox(
                      value: tasks[index]['isCompleted'],
                      onChanged: (bool? value) {
                        setState(() {
                          tasks[index]['isCompleted'] = value!;
                        });
                        _calculateProgress(); // Recalculate progress when the checkbox is toggled
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}