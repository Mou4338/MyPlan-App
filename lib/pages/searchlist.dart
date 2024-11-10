import 'package:flutter/material.dart';
class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<String> allTasks = ['Buy Groceries', 'Finish Homework', 'Call John', 'Write Flutter Code']; // Example tasks
  List<String> searchResults = [];

  void _searchTasks() {
    setState(() {
      searchResults = allTasks
          .where((task) => task.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Tasks'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Tasks',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => _searchTasks(),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(searchResults[index]),
                    onTap: () {
                      // Handle task click, perhaps show task details
                    },
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