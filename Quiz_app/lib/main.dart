import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/AddQuiz/SelectedQuestionsScreen.dart';
import 'package:quiz_app/AddQuiz/second.dart';
import 'package:quiz_app/home.dart';
import 'package:quiz_app/concent/navigation.dart';
import 'package:quiz_app/temp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAct7h56x5kwqUIKi2wwACCoBjO6D1XoEc",
      authDomain: "quiz-athlon-53576.firebaseapp.com",
      projectId: "quiz-athlon-53576",
      storageBucket: "quiz-athlon-53576.firebasestorage.app",
      messagingSenderId: "321929544402",
      appId: "1:321929544402:web:911931483f7907fc57a30b",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: SafeArea(child: NavigationBarr()),
      //home: AddQuestionsPage(),
      home: Second(),
    );
  }
}
