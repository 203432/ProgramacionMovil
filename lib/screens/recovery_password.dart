import 'package:flutter/material.dart';

class RecoveryPassword extends StatelessWidget {
  const RecoveryPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar contraseña'),
        iconTheme: const IconThemeData(color: Colors.pink),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 50.0),
                          child: Text(
                            'Ingresa tu email para restablecer tu contraseña',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 139, 138, 138)),
                          ),
                        ),
                        const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Correo Electronico',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 20,
                            top: 10,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              hintText: 'Direccion de correo',
                            ),
                          ),
                        ),
                        const Text(
                          'Ingrese su correo electronico  registrado y le enviaremos un correo electronico que contiene un enlace para restablecer su contraseña',
                          style: TextStyle(fontSize: 13.0, color: Colors.grey),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 400.0),
                          child: MaterialButton(
                            minWidth: 400,
                            height: 50,
                            color: const Color.fromARGB(255, 121, 171, 65),
                            onPressed: () async {
                              Navigator.pushNamed(context, '/recovery2');
                            },
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(40)),
                            child: const Text('Enviar solicitud',
                                style: TextStyle(fontSize: 16)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
