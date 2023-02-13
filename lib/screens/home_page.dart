import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Image.asset('assets/images/B2.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: MaterialButton(
              color: Colors.blue,
              onPressed: () async {},
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(60)),
              child: SizedBox(
                width: 330,
                height: 55,
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, right: 10.0),
                      child: Icon(
                        Icons.g_mobiledata_rounded,
                        size: 35,
                      ),
                    ),
                    Text("Continuar con google",
                        style: TextStyle(fontSize: 22)),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: MaterialButton(
              color: const Color.fromARGB(255, 6, 68, 118),
              onPressed: () async {},
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(60)),
              child: SizedBox(
                width: 330,
                height: 55,
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, right: 10.0),
                      child: Icon(
                        Icons.facebook,
                        size: 35,
                      ),
                    ),
                    Text("Continuar con facebook",
                        style: TextStyle(fontSize: 22)),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 60.0),
            child: MaterialButton(
              color: Colors.white,
              onPressed: () async {
                Navigator.pushNamed(context, '/register');
              },
              textColor: Colors.grey,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(60)),
              child: SizedBox(
                width: 330,
                height: 55,
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, right: 10.0),
                      child: Icon(
                        Icons.mail,
                        size: 35,
                      ),
                    ),
                    Text("Registrarse con email",
                        style: TextStyle(fontSize: 22)),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 12.0),
            child: Text(
              "Entrar como invitado",
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "¿Ya tienes una cuenta?",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              Text(
                "inicia sesion",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
