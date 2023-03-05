import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/models/user_model.dart';
import 'package:first_app/screens/home_page.dart';
import 'package:first_app/screens/usuario.dart';
import 'package:flutter/material.dart';

class Verificacion extends StatelessWidget {
  const Verificacion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            User user = snapshot.data!;
            String userName = user.displayName ?? '';
            String userToken = user.uid;
            return Usuario(user: UserModel(email: userName,token: userToken),);
          } else {
            return const HomePage();
          }
        }),
      ),
    );
  }
}
