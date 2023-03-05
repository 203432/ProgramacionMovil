import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/screens/body_register.dart';
import 'package:first_app/screens/body_boarding.dart';
import 'package:first_app/screens/home_page.dart';
import 'package:first_app/screens/login_screen.dart';
import 'package:first_app/screens/recovery_password.dart';
import 'package:first_app/screens/recovery_password2.dart';
import 'package:first_app/screens/verificacion.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

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
        '/verificar': (context) => const Verificacion(),
        '/register': (context) => const BodyRegister(),
        '/login': (context) =>  LoginScreen(),
        '/recovery': (context) => const RecoveryPassword(),
        '/recovery2': (context) => const RecoveryPassword2()
      },
    );
    // Para testear login
    // {
    //"email": "eve.holt@reqres.in",
    //"password": "cityslicka"
    //}

    //Para testear register
    //{
    //"email": "eve.holt@reqres.in",
    //"password": "pistol"
//} 
  }
}
