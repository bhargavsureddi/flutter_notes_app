import "package:flutter/material.dart";

import '../constants.dart';
import '../req_classes/singe_note.dart';
import '../screens/individual_note.dart';

class HomePageNote extends StatelessWidget {
  final String title;
  final List<String> values;
  HomePageNote({required this.title, required this.values});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Color(0xff424242),
      child: InkWell(
        splashColor: Colors.white.withOpacity(1.0),
        onTap: () {
          NoteOne newNote = NoteOne(title: title, values: values);
          Navigator.pushNamed(context, IndividualNote.individualNoteRoute,
              arguments: newNote);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
          ),
          padding: const EdgeInsets.all(8),
          child: Center(
              child: Text(
            title,
            style: kTitleTextField.copyWith(
                fontSize: 18.0, color: Color(0xffffffff)),
          )),
        ),
      ),
    );
  }
}
