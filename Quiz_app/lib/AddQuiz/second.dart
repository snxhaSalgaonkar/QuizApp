// import 'package:flutter/material.dart';
// import 'package:quiz_app/AddQuiz/Addquizmain.dart';
// import 'package:quiz_app/AddQuiz/ChooseCategoryQuestionsScreen.dart';
// import 'package:quiz_app/AddQuiz/SelectedQuestionsScreen.dart';

// import 'package:quiz_app/appbar.dart';
// import 'package:quiz_app/concent/color.dart';
// import 'package:quiz_app/AddQuiz/chooseQues.dart';

// class Second extends StatefulWidget {
//   const Second({super.key});

//   @override
//   State<Second> createState() => _SecondState();
// }

// class _SecondState extends State<Second> {
//   List<String> sports = [
//     "All",
//     "Badminton",
//     "Table Tennis",
//     "Cricket",
//     "Football",
//     "Hockey",
//   ];

//   List<IconData> sportIcons = [
//     Icons.category, // Generic icon for "All"
//     Icons.sports_tennis, // Badminton
//     Icons.sports_handball, // Table Tennis
//     Icons.sports_cricket, // Cricket
//     Icons.sports_soccer, // Football
//     Icons.sports_hockey, // Hockey
//   ];

//   List<int> selectedNumbers = List.filled(6, 0); // Store selected numbers
//   int totalSelected = 0;

//   void updateNumber(int index, int newValue) {
//     int currentTotal = totalSelected - selectedNumbers[index] + newValue;
//     if (currentTotal <= 100) {
//       setState(() {
//         totalSelected = currentTotal;
//         selectedNumbers[index] = newValue;
//       });
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Total must not exceed 100!'),
//           duration: Duration(seconds: 1),
//         ),
//       );
//     }
//   }

//   List<int> getNumberRange(String sport) {
//     return List.generate(sport == "All" ? 50 : 30, (index) => index + 1);
//   }

//   void showSummaryDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Selection Summary"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: List.generate(sports.length, (index) {
//               return ListTile(
//                 leading: Icon(
//                   sportIcons[index],
//                   color: const Color.fromARGB(255, 242, 128, 41),
//                 ),
//                 title: Text("${sports[index]}: ${selectedNumbers[index]}"),
//               );
//             }),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text("OK"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: appbar('Choose Questions from Database'),
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(20),
//             child: Column(
//               children: [
//                 SizedBox(height: 20),
//                 Text(
//                   'Total Selected: $totalSelected / 100',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 20),
//               ],
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: sports.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Container(
//                     height: 70,
//                     margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                     padding: EdgeInsets.symmetric(horizontal: 15),
//                     decoration: BoxDecoration(
//                       color: const Color.fromARGB(255, 250, 249, 248),
//                       borderRadius: BorderRadius.circular(15),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.1),
//                           blurRadius: 5,
//                           spreadRadius: 2,
//                           offset: Offset(2, 2),
//                         ),
//                       ],
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Icon(
//                               sportIcons[index],
//                               color: const Color.fromARGB(255, 234, 140, 57),
//                             ),
//                             SizedBox(width: 10),
//                             Text(
//                               sports[index],
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ],
//                         ),
//                         DropdownButton<int>(
//                           value:
//                               selectedNumbers[index] == 0
//                                   ? null
//                                   : selectedNumbers[index],
//                           hint: Text('Select'),
//                           items:
//                               getNumberRange(sports[index])
//                                   .map(
//                                     (num) => DropdownMenuItem<int>(
//                                       value: num,
//                                       child: Text('$num'),
//                                     ),
//                                   )
//                                   .toList(),
//                           onChanged: (value) {
//                             if (value != null) {
//                               updateNumber(index, value);
//                             }
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),

//           if (totalSelected == 100)
//             Padding(
//               padding: EdgeInsets.all(20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton(
//                     onPressed: showSummaryDialog,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blueAccent,
//                       padding: EdgeInsets.symmetric(
//                         vertical: 15,
//                         horizontal: 30,
//                       ),
//                     ),
//                     child: Text(
//                       "Veiw summary",
//                       style: TextStyle(fontSize: 18, color: Colors.white),
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder:
//                               (context) => ChooseCategoryQuestionsScreen(category: category, requiredQuestions: requiredQuestions, onQuestionsSelected: onQuestionsSelected)
//                         ),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blueAccent,
//                       padding: EdgeInsets.symmetric(
//                         vertical: 15,
//                         horizontal: 30,
//                       ),
//                     ),
//                     child: Text(
//                       "Submit",
//                       style: TextStyle(fontSize: 18, color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:quiz_app/AddQuiz/choose/choose.dart';
import 'package:quiz_app/AddQuiz/choose/final.dart';
import 'package:quiz_app/appbar.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  List<String> sports = [
    "All",
    "Badminton",
    "Table Tennis",
    "Cricket",
    "Football",
    "Hockey",
  ];
  List<IconData> sportIcons = [
    Icons.category,
    Icons.sports_tennis,
    Icons.sports_handball,
    Icons.sports_cricket,
    Icons.sports_soccer,
    Icons.sports_hockey,
  ];

  Map<String, int> selectedNumbers = {};
  Map<String, List<String>> selectedQuestions = {};

  void updateNumber(String sport, int newValue) {
    int totalSelected = selectedNumbers.values.fold(
      0,
      (prev, element) => prev + element,
    );
    if (totalSelected + newValue > 100) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Total must not exceed 100!")));
      return;
    }
    setState(() {
      selectedNumbers[sport] = newValue;
    });
  }

  void navigateToChooseQuestions(String sport) {
    int maxSelection = selectedNumbers[sport] ?? 0;
    if (maxSelection > 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) => ChooseQuestionsScreen(
                category: sport,
                maxSelection: maxSelection,
                onSelectionComplete: (selectedIds) {
                  setState(() {
                    selectedQuestions[sport] = selectedIds;
                  });
                },
              ),
        ),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please select a number first!")));
    }
  }

  void showFinalSelection() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) =>
                FinalSelectionScreen(selectedQuestions: selectedQuestions),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar('Choose Questions from Database'),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Total Selected: ${selectedNumbers.values.fold(0, (prev, element) => prev + element)} / 100',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: sports.length,
              itemBuilder: (context, index) {
                String sport = sports[index];
                return ListTile(
                  leading: Icon(sportIcons[index]),
                  title: Text(sport),
                  trailing: DropdownButton<int>(
                    value: selectedNumbers[sport],
                    hint: Text('Select'),
                    items:
                        List.generate(30, (index) => index + 1)
                            .map(
                              (num) => DropdownMenuItem<int>(
                                value: num,
                                child: Text('$num'),
                              ),
                            )
                            .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        updateNumber(sport, value);
                      }
                    },
                  ),
                  onTap: () => navigateToChooseQuestions(sport),
                );
              },
            ),
          ),
          if (selectedNumbers.values.fold(
                0,
                (prev, element) => prev + element,
              ) ==
              100)
            ElevatedButton(
              onPressed: showFinalSelection,
              child: Text("View Selected Questions"),
            ),
        ],
      ),
    );
  }
}
