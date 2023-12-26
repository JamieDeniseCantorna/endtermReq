import 'package:flutter/material.dart';

class AddNewList extends StatefulWidget {
  final Function(String, String, Color) addList; // Function to add the list

  AddNewList(this.addList);

  @override
  _AddNewListState createState() => _AddNewListState();
}

class _AddNewListState extends State<AddNewList> {
  String _title = 'New List';
  String _description = '';
  Color _selectedColor = Colors.blue; // Default color

  List<Color> _colorChoices = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.yellow,
  ];

  List<String> _colorNames = [
    'Blue',
    'Red',
    'Green',
    'Orange',
    'Purple',
    'Yellow',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New List",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade500,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Title",
                ),
                onChanged: (value) {
                  setState(() {
                    _title = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Description(optional)",
                ),
                onChanged: (value) {
                  setState(() {
                    _description = value;
                  });
                },
              ),
            ),
            DropdownButton<Color>(
                value: _selectedColor,
                onChanged: (Color? newValue) {
                  setState(() {
                    _selectedColor = newValue!;
                  });
                },
                items: _colorChoices.asMap().entries.map<DropdownMenuItem<Color>>((entry) {
                  return DropdownMenuItem<Color>(
                    value: entry.value,
                    child: Container(
                      width: 100.0,
                      height: 40.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: entry.value,
                      ),
                      child: Text(
                        _colorNames[entry.key],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ElevatedButton(
              onPressed: () {
                if (_title.isNotEmpty) {
                  widget.addList(_title, _description, _selectedColor);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$_title added'),
                      duration: Duration(seconds: 3),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          // Undo logic here if needed
                        },
                      ),
                    ),
                  );
                  Navigator.pop(context); // Navigate back
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Error"),
                        content: Text("Title cannot be empty!"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
