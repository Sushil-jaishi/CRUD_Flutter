import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Add extends StatelessWidget {
  String text='';
  String email = '';
  String userId = '';

  Add({required this.userId});

  @override
  Widget build(BuildContext context) {
    DateTime newdate = DateTime.now();
    String date = newdate.toString();
    CollectionReference users = FirebaseFirestore.instance.collection(userId);
    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .doc(date)
          .set({
            'text': text
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('ADD'),
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
              decoration: InputDecoration(
                  labelText: 'Enter your task',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      addUser();
                      Navigator.pop(context);
                    },
                    child: Text('Submit')))
          ],
        ),
      ),
    );
  }
}
