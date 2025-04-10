import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChooseCategoryQuestionsScreen extends StatefulWidget {
  final String category;
  final int requiredQuestions;
  final Function(List<Map<String, dynamic>>) onQuestionsSelected;

  ChooseCategoryQuestionsScreen({
    required this.category,
    required this.requiredQuestions,
    required this.onQuestionsSelected,
  });

  @override
  _ChooseCategoryQuestionsScreenState createState() =>
      _ChooseCategoryQuestionsScreenState();
}

class _ChooseCategoryQuestionsScreenState
    extends State<ChooseCategoryQuestionsScreen> {
  List<Map<String, dynamic>> allQuestions = [];
  List<Map<String, dynamic>> selectedQuestions = [];

  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }

  Future<void> fetchQuestions() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    List<Map<String, dynamic>> fetchedQuestions = [];

    try {
      QuerySnapshot snapshot =
          await firestore
              .collection('Questions')
              .doc('Round1')
              .collection(widget.category)
              .get();

      for (var doc in snapshot.docs) {
        fetchedQuestions.add({
          "id": doc.id,
          "question": doc["q"],
          "options": List<String>.from(doc["o"]),
          "answer": doc["a"],
        });
      }

      setState(() {
        allQuestions = fetchedQuestions;
      });
    } catch (e) {
      print("Error fetching questions: $e");
    }
  }

  void toggleSelection(Map<String, dynamic> question) {
    setState(() {
      if (selectedQuestions.contains(question)) {
        selectedQuestions.remove(question);
      } else if (selectedQuestions.length < widget.requiredQuestions) {
        selectedQuestions.add(question);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "You can only select ${widget.requiredQuestions} questions.",
            ),
            duration: Duration(seconds: 1),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          //'You Choosed ${itemSelected}/ ${widget.requiredQuestions} of ${widget.category}',
          "Choose ${widget.requiredQuestions} ${widget.category} Questions",
        ),
      ),
      body:
          allQuestions.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: allQuestions.length,
                itemBuilder: (context, index) {
                  final question = allQuestions[index];
                  final isSelected = selectedQuestions.contains(question);

                  return Card(
                    margin: EdgeInsets.all(8),
                    color: isSelected ? Colors.green.shade100 : Colors.white,
                    child: ListTile(
                      title: Text(question["question"]),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...question["options"]
                              .map<Widget>((option) => Text("• $option"))
                              .toList(),
                          SizedBox(height: 5),
                          Text(
                            "Answer: ${question["answer"]}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      trailing: Checkbox(
                        value: isSelected,
                        onChanged: (_) => toggleSelection(question),
                      ),
                    ),
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedQuestions.length == widget.requiredQuestions) {
            widget.onQuestionsSelected(selectedQuestions);
            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Select exactly ${widget.requiredQuestions} questions.",
                ),
                duration: Duration(seconds: 1),
              ),
            );
          }
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
