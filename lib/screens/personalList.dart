import 'package:flutter/material.dart';

class PersonalList extends StatelessWidget {
  final String title;

  const PersonalList({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Personal",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.blue.shade500,
        iconTheme: IconThemeData(color: Colors.white),
      ),
     
      body: Center(
        child: Text(
          'Nothing seems to be happening right now..',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}