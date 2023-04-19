import 'package:crud/add.dart';
import 'package:crud/customWidgets/item.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final CollectionReference usersCollection = firestore.collection('users');
    final Stream<QuerySnapshot> usersStream = usersCollection.snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        final List storeData = [];
        snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
          data['id'] = document.id;
          storeData.add(data);
        }).toList();
        return Scaffold(
            appBar: AppBar(
              title: Text('Hello'),
              backgroundColor: Color(0xE0E0E0),
              actions: [
                Container(
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return Add();
                            },
                          ));
                        },
                        child: Text('Add'))),
              ],
            ),
            body: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  for (var i = 0; i < storeData.length; i++) ...[
                    Items(
                        name: storeData[i]['name'],
                        email: storeData[i]['email'],
                        id: storeData[i]['id']),
                  ]
                ],
              ),
            ));
      },
    );
  }
}
