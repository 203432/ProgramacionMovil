import 'package:flutter/material.dart';

class ContentBoarding extends StatelessWidget {
  const ContentBoarding({super.key, this.text, this.image, this.descripcion});
  final String? text;
  final String? image;
  final String? descripcion;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Text(
            text!,
            style: const TextStyle(fontSize: 40),
          ),
        ),
        Image.asset(
          image!,
          height: 100,
        ),
        Text(
          descripcion!,
          style: const TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
