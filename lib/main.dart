import 'package:first_app/pages/register.dart';
import 'package:first_app/screens/body_boarding.dart';
import 'package:first_app/screens/home_page.dart';
import 'package:first_app/screens/recovery_password.dart';
import 'package:first_app/screens/recovery_password2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'All for my pet',
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Colors.pink),
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const BodyBoarding(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/homepage': (context) => const HomePage(),
        '/register': (context) => const Register(),
        '/recovery': (context) => const RecoveryPassword(),
        '/recovery2': (context) => const RecoveryPassword2()
      },
    );
  }
}
