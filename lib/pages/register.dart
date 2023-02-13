import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.pink),
        title: const Text('Registrate'),
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
                            'Crea una cuenta para empezar a usar la app',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 139, 138, 138)),
                          ),
                        ),
                        const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Nombre',
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
                              hintText: 'Nombre Completo',
                            ),
                          ),
                        ),
                        const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Correo electronico',
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
                        const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Contraseña',
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
                              hintText: 'Contraseña',
                            ),
                          ),
                        ),
                        const Text(
                          'La contraseña debe contener caracteres, numeros y simbolos con un minimo de 6 caracteres',
                          style: TextStyle(fontSize: 13.0, color: Colors.grey),
                        ),
                        ListTile(
                          title: const Text(
                            'Al registrarme, acepto los terminos y condiciones y la politica de privacidad',
                            style: TextStyle(fontSize: 12.0),
                          ),
                          leading: Radio(
                            value: "valor",
                            groupValue: "grupo",
                            onChanged: (value) {
                         
                            },
                          ),
                        ),
                        MaterialButton(
                          color: Colors.green,
                          onPressed: () async {
                            Navigator.pushNamed(context, '/recovery');
                          },
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 1, color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Text("Crear Cuenta",
                              style: TextStyle(fontSize: 16)),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Text('¿Ya tienes cuenta? Iniciar Sesion'),
                        )
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
