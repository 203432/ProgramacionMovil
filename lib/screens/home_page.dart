import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60.0, bottom: 20.0),
                child: Image.asset(
                  'assets/images/splash2.png',
                  height: 300,
                  width: 300,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: SizedBox(
                  width: 350,
                  height: 55,
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      FontAwesomeIcons.google,
                      size: 25,
                    ),
                    label: const Text("Continuar con google",
                        style: TextStyle(fontSize: 22)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          side:
                              const BorderSide(width: 1.0, color: Colors.grey),
                          borderRadius: BorderRadius.circular(60)),
                    ),
                    onPressed: () async {
                      sigInWithGoogle();
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: SizedBox(
                  width: 350,
                  height: 55,
                  child: ElevatedButton.icon(
                    icon: const Icon(FontAwesomeIcons.squareFacebook),
                    label: const Text("Continuar con facebook",
                        style: TextStyle(fontSize: 22)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 6, 68, 118),
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(60)),
                    ),
                    onPressed: () async {
                      sigInWithFacebook();
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
                child: SizedBox(
                  width: 350,
                  height: 55,
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.mail,
                      color: Colors.grey,
                    ),
                    label: const Text("Registrarse con email",
                        style: TextStyle(fontSize: 22, color: Colors.grey)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 3, color: Colors.grey),
                          borderRadius: BorderRadius.circular(60)),
                    ),
                    onPressed: () async {
                      Navigator.pushNamed(context, '/register');
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 12.0),
                child: Text(
                  "Entrar como invitado",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 12.0),
                child: Text(
                  "Entrar como vendedor",
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                    children: [
                      const TextSpan(
                          text: '¿Ya tienes una cuenta?',
                          style: TextStyle(fontSize: 18)),
                      TextSpan(
                        text: ' Iniciar sesión',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.red),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/login');
                          },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<UserCredential> sigInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> sigInWithFacebook() async {
    try {
      LoginResult loginResult = await FacebookAuth.instance.login();
      OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } on UserCredential catch (e) {
      return e;
    }
  }
}
