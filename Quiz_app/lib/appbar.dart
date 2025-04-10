import 'package:flutter/material.dart';

PreferredSizeWidget appbar(String title) {
  return AppBar(
    elevation: 0,

    title: Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.menu, size: 27),

        Center(child: Text(title, style: TextStyle(fontSize: 20))),
      ],
    ),
    actions: [CircleAvatar(radius: 18, child: Icon(Icons.person))],
    backgroundColor: Colors.purple,
  );
}
