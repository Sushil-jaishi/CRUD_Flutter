import 'package:crud/edit.dart';
import 'package:flutter/material.dart';

class Items extends StatelessWidget{
  final String name;
  final String email;
  Items({required this.name,required this.email});
  @override
  Widget build(BuildContext context) {
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
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return  Edit(name: name, email: email);
              },));
            }, child: Text('Edit')),
            SizedBox(width: 10,),
            ElevatedButton(onPressed: () {}, child: Text('Delete'))
          ],
        )
      ],
    );
  }

}