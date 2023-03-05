import 'package:first_app/screens/components/register/register.dart';
import 'package:flutter/material.dart';

class BodyRegister extends StatefulWidget {
  const BodyRegister({super.key});

  @override
  State<BodyRegister> createState() => _BodyRegisterState();
}

class _BodyRegisterState extends State<BodyRegister>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.pink),
        title: const Text('Registrate'),
      ),
      body: const Register(),
    );
  }
}
