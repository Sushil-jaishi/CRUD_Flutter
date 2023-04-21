import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Edit extends StatelessWidget {
  String text;
  final String documentId;
  final String userId;

  Edit(
      {required this.text,
      required this.documentId,
      required this.userId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection(userId);
    Future<void> editUser() {
      return users
          .doc(documentId)
          .set({
            'text': text
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit'),
        backgroundColor: Color(0xE0E0E0),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              onChanged: (value) {
                text = value;
              },
              initialValue: text,
              decoration: InputDecoration(
                  labelText: 'Enter your task',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 20,
            ),

            SizedBox(
              height: 20,
            ),
            Container(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      editUser();
                      Navigator.pop(context);
                    },
                    child: Text('Submit')))
          ],
        ),
      ),
    );
  }
}
