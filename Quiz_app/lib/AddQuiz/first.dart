import 'package:flutter/material.dart';
import 'package:quiz_app/appbar.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appbar("Create your own Quiz"));
  }
}
