import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Edit extends StatelessWidget {
  var name;
  var email;
  var id;

  Edit({required this.name, required this.email, required this.id});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    Future<void> editUser() {
      return users
          .doc(id)
          .set({
            'name': name, // John Doe
            'email': email, // Stokes and Sons
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
              onChanged: (name1) {
                name = name1;
              },
              initialValue: name,
              decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              onChanged: (email1) {
                email = email1;
              },
              initialValue: email,
              decoration: InputDecoration(
                  labelText: 'Email',
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
