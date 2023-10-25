import 'package:flutter/material.dart';

void main() {
  runApp(StudentInfoApp());
}

class StudentInfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Student Information'),
        ),
        body: StudentList(),
      ),
    );
  }
}

class StudentList extends StatelessWidget {
  final List<Map<String, dynamic>> students = [
    {'name': 'avinash singh', 'class': '10A', 'age': 15, 'sex': 'Male'},
    {'name': 'sarvottam sharma', 'class': '9B', 'age': 14, 'sex': 'Male'},
    {'name': 'rahul chopra', 'class': '11C', 'age': 16, 'sex': 'Male'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Student Information',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          for (var student in students)
            Container(
              margin: EdgeInsets.only(bottom: 8.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Name: ${student['name']}'),
                  Text('Class: ${student['class']}'),
                  Text('Age: ${student['age']}'),
                  Text('Sex: ${student['sex']}'),
                ],
              ),
            ),
        ],
      ),
    );
  }
}