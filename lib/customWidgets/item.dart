import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/edit.dart';
import 'package:flutter/material.dart';

class Items extends StatelessWidget {
  final String name;
  final String email;
  final String id;

  Items({required this.name, required this.email, required this.id});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    Future<void> deleteUser() {
      return users
          .doc(id)
          .delete()
          .then((value) => print("User Deleted"))
          .catchError((error) => print("Failed to delete user: $error"));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 20),
            ),
            Text(email),
          ],
        ),
        Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Edit(
                        name: name,
                        email: email,
                        id: id,
                      );
                    },
                  ));
                },
                child: Text('Edit')),
            SizedBox(
              width: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  deleteUser();
                },
                child: Text('Delete'))
          ],
        )
      ],
    );
  }
}
