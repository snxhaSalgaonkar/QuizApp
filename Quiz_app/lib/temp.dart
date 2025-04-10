import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddQuestionsPage extends StatefulWidget {
  const AddQuestionsPage({super.key});

  @override
  State<AddQuestionsPage> createState() => _AddQuestionsPageState();
}

class _AddQuestionsPageState extends State<AddQuestionsPage> {
  final q1 = TextEditingController(),
      op = TextEditingController(),
      ans = TextEditingController(),
      subtopic = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adding questions")),
      body: Column(
        children: [
          TextField(
            controller: subtopic,
            decoration: InputDecoration(hintText: "subtopic"),
          ),
          TextField(
            controller: q1,
            decoration: InputDecoration(hintText: "questions"),
          ),
          TextField(
            controller: op,
            decoration: InputDecoration(hintText: "options"),
          ),
          TextField(
            controller: ans,
            decoration: InputDecoration(hintText: "answer"),
          ),
          TextButton(
            onPressed: () async {
              await FirebaseFirestore.instance
                  .collection('Questions')
                  .doc('Round1')
                  .collection(subtopic.text.trim())
                  .doc()
                  .set({
                    'q': q1.text,
                    'o': op.text.split(','),
                    'a': ans.text.trim(),
                  });
              q1.text = "";
              op.text = "";
              ans.text = "";
              setState(() {});
            },
            child: Text("Add question"),
          ),
        ],
      ),
    );
  }
}
