import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../models/user_model.dart';
import '../services/login/login_services.dart';

class Usuario extends StatefulWidget {
  final UserModel user;
  Usuario({required this.user});
  @override
  _UsuarioState createState() => _UsuarioState();
}

class _UsuarioState extends State<Usuario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(widget.user.email),
            Text(widget.user.token),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Text('Logout'),
              label: Icon(Icons.logout),
              onPressed: () async {
                FirebaseAuth.instance.signOut();
                final logoutValue = await LoginService().logout();
                if (logoutValue == true) {
                  Navigator.of(context).pushReplacementNamed('/homepage');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 3),
                      content: Text(
                        'error with your token, have to login again',
                      ),
                    ),
                  );
                  Navigator.of(context).pushReplacementNamed('/homepage');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}