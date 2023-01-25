import 'package:first_app/pages/login.dart';
import 'package:first_app/pages/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false ,
      title: 'Flutter Demo',
      theme: ThemeData( 
        primarySwatch: Colors.indigo,
      ),
      home: const Login(),
    );
  }
}
