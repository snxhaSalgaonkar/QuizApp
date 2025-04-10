import 'package:flutter/material.dart';

class SelectedQuestionsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> selectedQuestions;

  SelectedQuestionsScreen({required this.selectedQuestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Final Selected Questions")),
      body: ListView.builder(
        itemCount: selectedQuestions.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(selectedQuestions[index]["question"]),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...selectedQuestions[index]["options"]
                      .map<Widget>((option) => Text("• $option"))
                      .toList(),
                  SizedBox(height: 5),
                  Text(
                    "Answer: ${selectedQuestions[index]["answer"]}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
