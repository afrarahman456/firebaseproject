import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Todoapp extends StatefulWidget {
  const Todoapp({super.key});

  @override
  State<Todoapp> createState() => _TodoappState();
}

class _TodoappState extends State<Todoapp> {
  TextEditingController _controller = TextEditingController();
  TextEditingController controller =TextEditingController();
  final _formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Scaffold(
        appBar: AppBar(title: Text("Todo App ")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter a text";
                  }
                },

                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Enter a todo",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),

              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter a name";
                  }
                },

                controller: controller,
                decoration: InputDecoration(
                  hintText: "Enter a name",
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),
              ElevatedButton(onPressed: () {
                if (_formkey.currentState!.validate()){
                  FirebaseFirestore.instance.collection("Todo").add({
                    "name" :_controller.text,
                    "text": controller.text,
                  });
                  print("sucsessfullY");
                  Navigator.of(context).pop();


                }
              }, child: Text("Add")),
            ],
          ),
        ),
      ),
    );
  }
}
