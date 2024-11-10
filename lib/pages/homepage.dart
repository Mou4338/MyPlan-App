import 'package:MyPlan/pages/addnote.dart';
import 'package:MyPlan/pages/newtask.dart';
import 'package:MyPlan/pages/profilescreen.dart';
import 'package:MyPlan/pages/progress.dart';
import 'package:MyPlan/pages/searchlist.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Settings action
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
          children: [
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: 'Today'),
                Tab(text: 'Monthly'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ToDoList(),
                  MonthlyCalendarPage(),
                ],
              ),
            ),
          ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.add_task),
              onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ToDoListScreen()));
              },
            ),
            IconButton(
              icon: Icon(Icons.checklist),
              onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPage()));
              },
            ),
            IconButton(
              icon: Icon(Icons.bar_chart),
              onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ProgressPage()));
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
              },
            ),
          ]
        )
      )
    );
  }
}

class Task {
  String title;
  DateTime dueDate;

  Task(this.title, this.dueDate);
}

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<Task> tasks = [
    Task("Buy groceries", DateTime(2024, 11, 15)),
    Task("Complete homework", DateTime(2024, 11, 12)),
    Task("Go for a walk", DateTime(2024, 11, 11)),
  ];

  // Edit Task
  void _editTask(int index) async {
    final editedTitle = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Task'),
          content: TextField(
            controller: TextEditingController(text: tasks[index].title),
            decoration: InputDecoration(hintText: "Enter task title"),
            onChanged: (value) {},
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(null); // Cancel
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop('edited task'); // Save
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );

    if (editedTitle != null) {
      setState(() {
        tasks[index].title = editedTitle;
      });
    }
  }

  // Delete Task
  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  // Edit Date
  void _editDate(int index) async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: tasks[index].dueDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    );

    if (newDate != null && newDate != tasks[index].dueDate) {
      setState(() {
        tasks[index].dueDate = newDate;
      });
    }
  }

  // Add New Task
  void _addTask() async {
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) {
        String title = '';
        DateTime selectedDate = DateTime.now();
        return AlertDialog(
          title: Text('Add New Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  title = value;
                },
                decoration: InputDecoration(hintText: "Enter task title"),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () async {
                  final DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(2023),
                    lastDate: DateTime(2030),
                  );
                  if (newDate != null) {
                    selectedDate = newDate;
                  }
                },
                child: Text('Select Due Date: ${selectedDate.toLocal()}'.split(' ')[0]),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(null); // Cancel
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (title.isNotEmpty) {
                  Navigator.of(context).pop({'title': title, 'dueDate': selectedDate});
                } else {
                  Navigator.of(context).pop(null);
                }
              },
              child: Text('Add Task'),
            ),
          ],
        );
      },
    );

    if (result != null) {
      setState(() {
        tasks.add(Task(result['title'], result['dueDate']));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _addTask, // Add Task button
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewNotePage(onSave: (String title, String content) {  },)),
              );
            },
            child: Card(
              margin: EdgeInsets.all(10),
              elevation: 5,
              child: ListTile(
                title: Text(tasks[index].title),
                subtitle: Text('Due: ${tasks[index].dueDate.toLocal()}'.split(' ')[0]),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => _editTask(index),
                    ),
                    IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () => _editDate(index),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteTask(index),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
class MonthlyCalendarPage extends StatefulWidget {
  @override
  State<MonthlyCalendarPage> createState() => _MonthlyCalendarPageState();
}

class _MonthlyCalendarPageState extends State<MonthlyCalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;

  DateTime _selectedDay = DateTime.now();

  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Text('Monthly Calender'),
      TableCalendar(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
      ),
    ]));
  }
}
