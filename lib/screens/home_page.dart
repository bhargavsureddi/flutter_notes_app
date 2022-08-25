import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../components/note_widget_home.dart';
import 'add_new_note.dart';

class HomePage extends StatefulWidget {
  static const String homeRoute = "home";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _db = FirebaseFirestore.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    streamOfData();
  }

  void getData() async {
    final x = await _db.collection("notes").get();
    for (var i in x.docs) {
      print(i.data());
    }
  }

  void streamOfData() async {
    await for (var snapShot in _db.collection("notes").snapshots()) {
      for (var x in snapShot.docs) {
        print(x.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Add your note"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 32.0,
          ),
          onPressed: () {
            Navigator.pushNamed(context, AddNewNote.addNoteRoute);
          },
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: _db.collection("notes").snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text("Add new Notes"),
                    );
                  }
                  final data = snapshot.data!.docs;
                  List<HomePageNote> allNotes = data.map((note) {
                    Map<String, dynamic> oneNote =
                        note.data() as Map<String, dynamic>;
                    String title = oneNote["title"];
                    List<dynamic> dynamicValues = oneNote["values"];
                    final List<String> values =
                        dynamicValues.map((e) => e.toString()).toList();
                    return HomePageNote(title: title, values: values);
                  }).toList();
                  return Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: allNotes,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
