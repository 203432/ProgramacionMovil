import 'package:first_app/models/register_model.dart';
import 'package:first_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import '../../../interfaces/register/register_interface.dart';
import '../../../services/register/register_services.dart';
import '../../usuario.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final IRegister _registerService = RegisterService();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool showPass = true;
  bool politicsBool = false;
  late PageController varController;

  @override
  void initState() {
    super.initState();
    varController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    varController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
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
                          controller: _nameController,
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
                          controller: _emailController,
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
                          controller: _passwordController,
                          obscureText: showPass == true ? true : false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            hintText: 'Contraseña',
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (showPass == false) {
                                    showPass = true;
                                  } else {
                                    showPass = false;
                                  }
                                });
                              },
                              child: showPass == true
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0, bottom: 20.0),
                        child: Text(
                          'La contraseña debe contener caracteres, numeros y simbolos con un minimo de 6 caracteres',
                          style: TextStyle(fontSize: 12.5, color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 60.0),
                        child: Row(
                          children: [
                            Checkbox(
                              shape: const CircleBorder(),
                              value: politicsBool == true ? true : false,
                              onChanged: (bool? value) {
                                setState(() {
                                  if (politicsBool == false) {
                                    politicsBool = true;
                                  } else {
                                    politicsBool = false;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 300,
                              child: RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 13.0),
                                  children: [
                                    TextSpan(
                                        text: 'Al registrarme, acepto los',
                                        style: TextStyle(fontSize: 13.0)),
                                    TextSpan(
                                      text: ' terminos y condiciones',
                                      style: TextStyle(
                                          fontSize: 12.5, color: Colors.red),
                                    ),
                                    TextSpan(
                                        text: ' y la',
                                        style: TextStyle(fontSize: 13.0)),
                                    TextSpan(
                                      text: ' politica de privacidad',
                                      style: TextStyle(
                                          fontSize: 12.5, color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: 400,
                        height: 50,
                        color: const Color.fromARGB(255, 121, 171, 65),
                        onPressed: () async {
                          if (_emailController.text.isNotEmpty &&
                              _passwordController.text.isNotEmpty) {
                            RegisterModel? registro = await _registerService.login(
                              _nameController.text,
                                _emailController.text,
                                _passwordController.text);
                                
                            if (registro != null) {
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (_) => Usuario(user: UserModel(email: _emailController.text, token: 'usuario creado')),
                                ),
                              );
                            } else {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  duration: Duration(seconds: 3),
                                  content: Text('email or password incorrect'),
                                ),
                              );
                              return null;
                            }
                          }
                        },
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(40)),
                        child: const Text('Crear cuenta',
                            style: TextStyle(fontSize: 16)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                                color: Colors.black, fontSize: 14),
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
          },
        ),
      ),
    );
  }
}
