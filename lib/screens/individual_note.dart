import 'package:flutter/material.dart';

import '../constants.dart';

class IndividualNote extends StatelessWidget {
  static const String individualNoteRoute = "individual";
  final String title;
  final List<String> values;
  IndividualNote({required this.title, required this.values});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 1.0,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/newp.jpg"),
          fit: BoxFit.fill,
        )),
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: kTitleTextField.copyWith(fontSize: 36, color: Colors.grey),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Text(values[index],
                      style: kTitleTextField.copyWith(
                          color: Colors.grey.shade700,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          height: 1.5));
                },
                itemCount: values.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
