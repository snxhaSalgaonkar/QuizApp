import 'package:flutter/material.dart';
import 'package:quiz_app/appbar.dart';
import 'package:quiz_app/concent/color.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int indexx = 0;
  List<String> Category = ["All", "Upcoming", "Ongoing", "Past"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("Admin Panel"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Center(child: Icon(Icons.quiz, size: 40)),
          Text(
            'App Logo',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
          ),
          SizedBox(height: 10),
          Container(width: 100, height: 2.5, color: Colors.black),
          SizedBox(height: 12),

          // Category Selection
          SizedBox(
            height: 60,
            child: ListView.builder(
              itemCount: Category.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      indexx = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    padding: EdgeInsets.symmetric(horizontal: 17),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: indexx == index ? maincolor2 : Colors.white,
                      boxShadow: [
                        if (indexx == index)
                          BoxShadow(color: maincolor2, blurRadius: 7),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        Category[index],
                        style: TextStyle(
                          fontSize: 18,
                          color: indexx == index ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 12),

          // Quiz List
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 3,
                  child: ListTile(
                    title: Text("Quiz $index"),
                    subtitle: Text("Quiz Description"),
                    leading: Icon(Icons.quiz),
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
