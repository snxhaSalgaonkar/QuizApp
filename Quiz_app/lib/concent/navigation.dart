import 'package:flutter/material.dart';
import 'package:quiz_app/AddQuiz/Addquizmain.dart';
import 'package:quiz_app/concent/color.dart';
import 'package:quiz_app/home.dart';
import 'package:quiz_app/participants.dart';

class NavigationBarr extends StatefulWidget {
  const NavigationBarr({super.key});

  @override
  State<NavigationBarr> createState() => _NavigationBarrState();
}

class _NavigationBarrState extends State<NavigationBarr> {
  int indexx = 0;
  List screen = [Home(), AddQuizMain(), Participants()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            indexx = 1;
          });
        },

        backgroundColor: maincolor1,
        child: Icon(Icons.add, size: 20),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    indexx = 0;
                  });
                },
                child: Icon(
                  Icons.home,
                  size: 27,
                  color: 0 == indexx ? maincolor2 : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    indexx = 2;
                  });
                },
                child: Icon(
                  Icons.people_alt,
                  size: 27,
                  color: 2 == indexx ? maincolor2 : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
      body: screen[indexx],
    );
  }
}
