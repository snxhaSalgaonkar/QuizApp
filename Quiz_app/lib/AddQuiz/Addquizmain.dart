import 'package:flutter/material.dart';
import 'package:quiz_app/AddQuiz/first.dart';
import 'package:quiz_app/AddQuiz/second.dart';
import 'package:quiz_app/AddQuiz/third.dart';
import 'package:quiz_app/appbar.dart';
import 'package:quiz_app/concent/color.dart';

class AddQuizMain extends StatefulWidget {
  const AddQuizMain({super.key});

  @override
  State<AddQuizMain> createState() => _AddQuizMainState();
}

class _AddQuizMainState extends State<AddQuizMain> {
  List Category = [
    'Make your own questions',
    'Choose Questions from Database',
    'Generate Random Question',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar('Choose Category'),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Colors.white30),
                  child: Text(
                    "Choose a Category",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),

          // Use Expanded to avoid ListView height errors
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      Navigator.of(
                        context,
                      ).push(MaterialPageRoute(builder: (context) => First()));
                    } else if (index == 1) {
                      Navigator.of(
                        context,
                      ).push(MaterialPageRoute(builder: (context) => Second()));
                    } else {
                      Navigator.of(
                        context,
                      ).push(MaterialPageRoute(builder: (context) => Third()));
                    }
                  },
                  child: Container(
                    height: 100,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: maincolor1,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      Category[index],
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
