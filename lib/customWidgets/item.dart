import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/edit.dart';
import 'package:flutter/material.dart';

class Items extends StatelessWidget {
  final String text;
  final String documentId;
  final String userId;

  Items({
    required this.text,
    required this.documentId,
    required this.userId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection(userId);
    Future<void> deleteUser() {
      return users
          .doc(documentId)
          .delete()
          .then((value) => print("User Deleted"))
          .catchError((error) => print("Failed to delete user: $error"));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 17),
          ),
        ),
        Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Edit(
                        text: text,
                        documentId: documentId,
                        userId: userId,
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
