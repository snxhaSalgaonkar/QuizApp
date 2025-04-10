import 'package:flutter/material.dart';
import 'package:quiz_app/appbar.dart';

class Third extends StatefulWidget {
  const Third({super.key});

  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appbar("generate using AI"));
  }
}
