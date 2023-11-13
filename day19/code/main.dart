import 'package:flutter/material.dart';

void main() {
  runApp(StudentInfoApp());
}

class StudentInfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: TodoScreen(),
          ),
        ),
      ),
    );
  }
}

class Todo {
  String task;
  bool isCompleted;

  Todo({
    required this.task,
    this.isCompleted = false,
  });
}

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Todo> todos = ["homework", "cooking"]
      .map((e) => Todo(
            task: e,
          ))
      .toList();

  // List<Todo> todos = [];

  void addTodo(String todo) {
    setState(() {
      todos.add(Todo(task: todo));
    });
  }

  void removeTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  void removeTodoByName(String taskName) {
    setState(() {
      todos.removeWhere((todo) => todo.task == taskName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff764abc),
        title: Text('To-Do App'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(20),
            height: 600,
            width: double.infinity,
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return LongPressDraggable(
                  data: todos[index],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                       shape: RoundedRectangleBorder( //<-- SEE HERE
                      side: BorderSide(width: 2, color: const Color.fromARGB(255, 160, 160, 160)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xff764abc),
                        child: Text(index.toString()),
                      ),
                      title: Text(todos[index].task),
                    ),
                  ),
                  feedback: Container(
                    width: 100,
                    height: 100,
                    color: Color.fromARGB(255, 192, 152, 255).withOpacity(0.5),
                    child: Scaffold(
                        body: Center(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: const Color(0xff764abc),
                              child: Text(index.toString()),
                            ),
                            title: Text(todos[index].task),
                          ),
                        ),
                      ),
                    
                  ),
                  childWhenDragging: Container(
                    width: 100,
                    height: 100,
                    color: Color.fromARGB(255, 192, 153, 255),
                  ),
                );
              },
            ),
          ),
          DragTarget<Todo>(
            builder: (context, incomming, rejectedData) {
              print(incomming);
              return Container(
                height: 100,
                width: 100,
                color: Colors.red,
                child: Image.asset("assets/delicon.png"),
              );
            },
            // onWillAccept: (data) {
            //   return true;
            // },
            onAccept: (data) {
              print(data);
              removeTodoByName(data.task);
            },
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff764abc),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              String newTodo = '';
              return AlertDialog(
                title: Text('Add To-Do'),
                content: TextField(
                  onChanged: (value) {
                    newTodo = value;
                  },
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('Add'),
                    onPressed: () {
                      addTodo(newTodo);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        tooltip: 'Add To-Do',
        child: Icon(Icons.add),
      ),
    );
  }
}
