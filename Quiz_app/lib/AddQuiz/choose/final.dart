import 'package:flutter/material.dart';

class FinalSelectionScreen extends StatelessWidget {
  final Map<String, List<String>> selectedQuestions;

  const FinalSelectionScreen({Key? key, required this.selectedQuestions})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Final Selection")),
      body: ListView(
        children:
            selectedQuestions.entries.map((entry) {
              return ListTile(
                title: Text(
                  "${entry.key} - ${entry.value.length} questions selected",
                ),
                subtitle: Text(
                  entry.value.join(", "),
                ), // Shows selected question IDs
              );
            }).toList(),
      ),
    );
  }
}
