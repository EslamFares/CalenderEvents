import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/classlink/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.amber,
        primarySwatch: Colors.amber,
        primaryColorLight: Colors.amber.shade200,
        focusColor: Colors.red,
        shadowColor: Colors.amberAccent,
        // colorSchemeSeed: Colors.amberAccent,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
        ),
        useMaterial3: true,
      ),
      // home: const HomeView(),
      // home: const TableEventsExample(),
      home: const LoginScreen(),
    );
  }
}
