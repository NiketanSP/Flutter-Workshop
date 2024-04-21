// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:noteapp/main.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String title = "";
  String note = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        backgroundColor: Colors.amber[800],
        foregroundColor: Colors.amber[100],
        automaticallyImplyLeading: false,
        title: TextField(
            style: TextStyle(
              color: Colors.amber[100],
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            onChanged: (value){
            title = value;
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Title",
            hintStyle: TextStyle(
              color: Colors.amber[100],
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        margin: EdgeInsets.all(10),
        child: TextField(
          onChanged: (value){
            note = value;
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Enter your note here...",
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          NoteClass newNote = NoteClass(title, note);
          //allNotes.add(newNote);
          Navigator.pop(context, newNote);
        },
        child: Icon(Icons.done),
        backgroundColor: Colors.amber[800],
        foregroundColor: Colors.amber[100],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}