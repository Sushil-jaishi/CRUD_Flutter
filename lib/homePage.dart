import 'package:crud/add.dart';
import 'package:crud/customWidgets/item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              Items(name: 'Sushil', email: 'sushiljaishi@gmail.com'),
            ],
          ),
        ));
  }
}
