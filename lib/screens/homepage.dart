import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/screens/provider/todoprovider.dart';
import 'package:todo/screens/todoaction.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textFieldController = TextEditingController();
  String newTask = '';
  @override
  void initState() {
    super.initState();
    _textFieldController.addListener(() {
      newTask = _textFieldController.text;
    });
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  void _submit() {
    Provider.of<TodoProvider>(context, listen: false).addTask(newTask);
    Navigator.pop(context);
    _textFieldController.clear();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _showAddTextDialog() async {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Add New Task"),
              content: TextField(
                autofocus: true,
                controller: _textFieldController,
                decoration: const InputDecoration(hintText: "Add New Task",),
                onSubmitted: (_) => _submit(),
              ),
              actions: [
                ElevatedButton(
                  onPressed: _submit,
                  child: const Text("Submit",),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                      minimumSize: const Size(120, 40)),
                )
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              actionsAlignment: MainAxisAlignment.center,
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("Todo App")),
        backgroundColor: Colors.teal,
      ),
      body: TodoAction(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: (() {
          _showAddTextDialog();
        }),
        child: const Icon(Icons.add,),
        tooltip: "Add a Todo",
      ),
    );
  }
}