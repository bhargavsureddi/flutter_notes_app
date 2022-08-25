import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'req_classes/singe_note.dart';
import 'screens/add_new_note.dart';
import 'screens/home_page.dart';
import 'screens/individual_note.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff000000),
        appBarTheme:
            AppBarTheme(elevation: 5.0, backgroundColor: Color(0xff1f1f1f)),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Color(0xffed9600))),
    home: HomePage(),
    onGenerateRoute: (RouteSettings settings) {
      print('build route for ${settings.name}');
      Map routes = {
        HomePage.homeRoute: (context) => HomePage(),
        AddNewNote.addNoteRoute: (context) => AddNewNote(),
        IndividualNote.individualNoteRoute: (context) {
          NoteOne args = settings.arguments as NoteOne;
          return IndividualNote(title: args.title, values: args.values);
        }
      };
      WidgetBuilder builder = routes[settings.name];
      return MaterialPageRoute(builder: (context) => builder(context));
    },
  ));
}
