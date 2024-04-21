// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:noteapp/second.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.amber,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}
//List<NoteClass> allNotes = [];
class NoteClass{
  String title;
  String note;
  NoteClass(this.title, this.note);
}

class HomeScreenState extends State<HomeScreen> {
  List<NoteClass> allNotes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        backgroundColor: Colors.amber[800],
        title: Center(
          child: Text(
            'Notes',
            style: TextStyle(
              color: Colors.amber[100],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: allNotes.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    padding: EdgeInsets.all(10),
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.amber[200],
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.orange,
                        width: 3
                        ),
                    ),
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${allNotes[index].title}",
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                      ),
                  ),
                  Expanded(child: Text(
                      "${allNotes[index].note}"))
                ],
              ),
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async {
        NoteClass? newNote = await Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => const SecondScreen())
          );
          if(newNote == null) return;
          allNotes.add(newNote);
          setState(() {
            
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.amber[800],
        foregroundColor: Colors.amber[100],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
