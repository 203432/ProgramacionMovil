import 'package:first_app/screens/components/content_boarding.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentePage = 0;
  List<Map<String, String>> listBoarding = [
    {
      "titulo": "BMO",
      "imagen": "assets/images/bmo.jpg",
      "descripcion": "ese es bmo"
    },
    {
      "titulo": "Jake",
      "imagen": "assets/images/jake.jfif",
      "descripcion": "ese es jake"
    },
    {
      "titulo": "El Chueck",
      "imagen": "assets/images/shrek.jfif",
      "descripcion": "shrek"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: PageView.builder(
              itemBuilder: (context, index) => ContentBoarding(
                text: listBoarding[index]['titulo'],
                image: listBoarding[index]['imagen'],
                descripcion: listBoarding[index]['descripcion'],
              ),
              itemCount: listBoarding.length,
            ),
          ),
          const Expanded(
            flex: 2,
            child: Center(
              child: OutlinedButton(
                onPressed: null,
                child: Text('Button'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
