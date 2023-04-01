import 'package:flutter/material.dart';
import 'package:note_app/screens/notesList.dart';
import './screens/notes_detail.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Note App",
      theme: ThemeData(primaryColor: Colors.lightBlueAccent),
      home: const NoteList()
          );
  }
}

