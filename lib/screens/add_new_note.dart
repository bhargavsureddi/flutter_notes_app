import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class AddNewNote extends StatefulWidget {
  static const String addNoteRoute = "newNote";
  @override
  State<AddNewNote> createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<AddNewNote> {
  late TextEditingController _controllerTitle;
  late TextEditingController _controllerValues;
  late String title;
  late String notes;
  late List<String> values;
  final _db = FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerTitle = TextEditingController();
    _controllerValues = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controllerTitle.dispose();
    _controllerValues.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff000000),
        actions: [
          IconButton(
              onPressed: () {
                print(title);
                values = notes.trim().split("\n");
                print(values);
                final data = {"title": title, "values": values};
                final docId = _db.collection("notes").add(data);
                _controllerValues.clear();
                _controllerTitle.clear();
                Navigator.pop(context);
              },
              icon: Padding(
                padding: EdgeInsets.only(right: 25.0),
                child: Icon(Icons.check),
              ))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
          child: Column(
            children: [
              TextField(
                textCapitalization: TextCapitalization.sentences,
                controller: _controllerTitle,
                cursorColor: Color(0xffed9600),
                style: kTitleTextField,
                decoration: kTextFieldNewNote,
                onChanged: (String newTitle) {
                  title = newTitle.trim();
                },
              ),
              Expanded(
                child: TextFormField(
                  textCapitalization: TextCapitalization.sentences,
                  cursorColor: Color(0xffed9600),
                  maxLines: 45,
                  minLines: 1,
                  // expands: true,
                  controller: _controllerValues,

                  keyboardType: TextInputType.multiline,
                  style: kTitleTextField.copyWith(
                      color: Colors.white70,
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                      height: 1.4),
                  decoration: kTextFieldNewNote.copyWith(
                    hintText: "Start Typing notes",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w300,
                      fontSize: 24,
                    ),
                  ),
                  onChanged: (String newNotes) {
                    notes = newNotes;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
