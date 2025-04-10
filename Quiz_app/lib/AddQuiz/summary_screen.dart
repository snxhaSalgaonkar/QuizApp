import 'package:flutter/material.dart';

class SummaryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> selectedQuestions;

  const SummaryScreen({super.key, required this.selectedQuestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selected Questions Summary"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: selectedQuestions.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(selectedQuestions[index]["question"]));
        },
      ),
    );
  }
}
