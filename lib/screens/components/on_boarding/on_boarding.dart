import 'package:first_app/screens/components/on_boarding/content_boarding.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentPage = 0;
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

  List<Map<String, String>> listBoarding = [
    {
      "titulo": "ESPARCIMIENTO",
      "imagen": "assets/images/B1.png",
      "descripcion": "brindamos todos los servicios para ",
      "descripcion2": "consentir a tu mascota",
    },
    {
      "titulo": "ADOPCION",
      "imagen": "assets/images/B2.png",
      "descripcion": "nulla faucibus tellus ut odio scelerisque, ",
      "descripcion2": "vitae molestie lectus feugiat",
    },
    {
      "titulo": "HOSPITALIDAD",
      "imagen": "assets/images/B3.png",
      "descripcion": "nulla faucibus tellus ut odio scelerisque,",
      "descripcion2": "vitae molestie lectus feugiat",
    },
    {
      "titulo": "VETERINARIA",
      "imagen": "assets/images/B4.png",
      "descripcion": "nulla faucibus tellus ut odio scelerisque,",
      "descripcion2": "vitae molestie lectus feugiat",
    },
    {
      "titulo": "TIENDA",
      "imagen": "assets/images/B5.png",
      "descripcion": "Compra todas las necesidades de tu ",
      "descripcion2": "mascota sin salir de casa",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 600,
            child: PageView.builder(
              controller: varController,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemBuilder: (context, index) => ContentBoarding(
                text: listBoarding[index]['titulo'],
                image: listBoarding[index]['imagen'],
                descripcion: listBoarding[index]['descripcion'],
                descripcion2: listBoarding[index]['descripcion2'],
              ),
              itemCount: listBoarding.length,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      listBoarding.length,
                      (index) =>
                          pages(index: index, currentePage: currentPage)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 145),
                  child: SizedBox(
                    height: 50,
                    width: 300,
                    child: MaterialButton(
                      color: currentPage == listBoarding.length - 1
                          ? Colors.green
                          : Colors.white,
                      onPressed: () async {
                        currentPage == listBoarding.length - 1
                            ? Navigator.pushReplacementNamed(context, '/verificar')
                            : varController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut);
                      },
                      textColor: currentPage == listBoarding.length - 1
                          ? Colors.white
                          : Colors.grey,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                          currentPage == listBoarding.length - 1
                              ? 'Continuar'
                              : "Siguiente",
                          style: const TextStyle(fontSize: 16)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

AnimatedContainer pages({required int index, required int currentePage}) {
  return AnimatedContainer(
    margin:const EdgeInsets.only(right: 5),
    width: currentePage == index ? 25 : 15,
    height: 5,
    duration: kThemeAnimationDuration,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: currentePage == index
            ? Colors.pink
            : const Color.fromARGB(255, 175, 171, 171)),
  );
}
