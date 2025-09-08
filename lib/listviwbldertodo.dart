import 'package:firebase_project/todoapp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Listviwbldertodo extends StatefulWidget {
  const Listviwbldertodo({super.key});

  @override
  State<Listviwbldertodo> createState() => _ListviwbldertodoState();
}

class _ListviwbldertodoState extends State<Listviwbldertodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Example"),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete, color: Colors.red),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return Todoapp();
              },
            ),
          );
        },
      ),
    );
  }
}
