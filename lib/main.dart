import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/screens/homepage.dart';
import 'package:todo/screens/provider/todoprovider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context)=> TodoProvider()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sample Todo App',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home:HomePage(),
      ),
    );
  }
}

