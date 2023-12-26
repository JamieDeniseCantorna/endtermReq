import 'package:endterm_project/screens/addList.dart';
import 'package:flutter/material.dart';

class AllList extends StatefulWidget {
  const AllList({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _AllListState createState() => _AllListState();
}

class _AllListState extends State<AllList> {
  List<Map<String, dynamic>> _addedLists = [
    {'title': 'Personal', 'color': Colors.blue},
    {'title': 'Chores', 'color': Colors.green},
    {'title': 'School', 'color': Colors.orange},
  ];

  void _addList(String title, String description, Color color) {
    setState(() {
      _addedLists.add({
        'title': title,
        'description': description,
        'color': color,
      });
    });
    _showUndoSnackBar(title);
  }

  void _showUndoSnackBar(String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$title added'),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _addedLists.removeWhere((element) => element['title'] == title);
            });
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.blue.shade500,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue.shade500,
              ),
              child: Text(
                'Do-ly Noted',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.list_rounded),
              title: Text('All Lists'),
              selected: true,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('History'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: _addedLists.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: _addedLists[index]['color'],
                  child: Text(
                    _addedLists[index]['title'][0], // Display first character
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(_addedLists[index]['title']),
                onTap: () {
                  // Handle tapping the added list
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => AddNewList(),
                  //   ),
                  // );
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNewList(_addList)),
           );
          },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue.shade500,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}