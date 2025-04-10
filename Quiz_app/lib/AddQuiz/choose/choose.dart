import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChooseQuestionsScreen extends StatefulWidget {
  final String category;
  final int maxSelection;
  final Function(List<String>) onSelectionComplete;

  const ChooseQuestionsScreen({
    Key? key,
    required this.category,
    required this.maxSelection,
    required this.onSelectionComplete,
  }) : super(key: key);

  @override
  _ChooseQuestionsScreenState createState() => _ChooseQuestionsScreenState();
}

class _ChooseQuestionsScreenState extends State<ChooseQuestionsScreen> {
  List<Map<String, dynamic>> questionsList = [];
  List<String> selectedQuestionIds = [];

  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }

  Future<void> fetchQuestions() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance
              .collection("Questions")
              .doc("Round1")
              .collection(widget.category)
              .get();

      List<Map<String, dynamic>> tempList =
          querySnapshot.docs.map((doc) {
            return {
              "id": doc.id,
              "question": doc["q"],
              "options": List<String>.from(doc["o"]),
              "answer": doc["a"],
            };
          }).toList();

      setState(() {
        questionsList = tempList;
      });
    } catch (e) {
      print("Error fetching questions: $e");
    }
  }

  void toggleSelection(String questionId) {
    setState(() {
      if (selectedQuestionIds.contains(questionId)) {
        selectedQuestionIds.remove(questionId);
      } else if (selectedQuestionIds.length < widget.maxSelection) {
        selectedQuestionIds.add(questionId);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "You can only select ${widget.maxSelection} questions!",
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.category} Questions")),
      body:
          questionsList.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: questionsList.length,
                itemBuilder: (context, index) {
                  var question = questionsList[index];
                  bool isSelected = selectedQuestionIds.contains(
                    question["id"],
                  );

                  return Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(question["question"]),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                            question["options"]
                                .map<Widget>((option) => Text("• $option"))
                                .toList(),
                      ),
                      trailing: Icon(
                        isSelected ? Icons.check_circle : Icons.circle_outlined,
                        color: isSelected ? Colors.green : Colors.grey,
                      ),
                      onTap: () => toggleSelection(question["id"]),
                    ),
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedQuestionIds.length == widget.maxSelection) {
            widget.onSelectionComplete(selectedQuestionIds);
            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Please select exactly ${widget.maxSelection} questions!",
                ),
              ),
            );
          }
        },
        child: Icon(Icons.done),
      ),
    );
  }
}
