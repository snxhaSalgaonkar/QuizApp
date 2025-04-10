import 'package:flutter/material.dart';

class ChooseQuestionsScreen extends StatefulWidget {
  @override
  _ChooseQuestionsScreenState createState() => _ChooseQuestionsScreenState();
}

class _ChooseQuestionsScreenState extends State<ChooseQuestionsScreen> {
  // Sample Questions Data
  List<Map<String, dynamic>> questionData = [
    {
      "question": "What is the national sport of Canada?",
      "options": ["Hockey", "Basketball", "Football", "Cricket"],
      "correctAnswer": "Hockey",
      "category": "Hockey",
    },
    {
      "question": "Which country won the first FIFA World Cup?",
      "options": ["Brazil", "Argentina", "Uruguay", "Germany"],
      "correctAnswer": "Uruguay",
      "category": "Football",
    },
    {
      "question": "Which country won the second FIFA World Cup?",
      "options": ["Iatly", "Argentina", "Uruguay", "Germany"],
      "correctAnswer": "Uruguay",
      "category": "Football",
    },
  ];

  // Track Selected Questions
  List<Map<String, dynamic>> selectedQuestions = [];

  // Function to Toggle Selection
  void toggleSelection(int index) {
    setState(() {
      if (selectedQuestions.contains(questionData[index])) {
        selectedQuestions.remove(questionData[index]);
      } else {
        selectedQuestions.add(questionData[index]);
      }
    });
  }

  // Show Summary Dialog
  void showSummaryDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Selected Questions"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children:
                selectedQuestions.map((question) {
                  return ListTile(
                    title: Text(question['question']),
                    subtitle: Text("Category: ${question['category']}"),
                  );
                }).toList(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Choose Questions")),
      body: ListView.builder(
        itemCount: questionData.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(questionData[index]["question"]),
              subtitle: Text("Category: ${questionData[index]["category"]}"),
              trailing: Checkbox(
                value: selectedQuestions.contains(questionData[index]),
                onChanged: (value) => toggleSelection(index),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar:
          selectedQuestions.isNotEmpty
              ? Padding(
                padding: EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: showSummaryDialog,
                  child: Text("Submit (${selectedQuestions.length} Selected)"),
                ),
              )
              : SizedBox.shrink(),
    );
  }
}
