import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pixel_perfect/pixel_perfect.dart';
import 'package:flutter/src/rendering/box.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
            headline4: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 0.1),
            headline1: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 0.35),
            headline2: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                letterSpacing: 0.25),
            headline3: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 0.25),
            headline6: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w700, color: Colors.grey),
            subtitle1: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: -0.25),
            subtitle2: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: -0.5),
            headline5: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue,
                letterSpacing: -0.5)),
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final urlImages = [
      "assets/image1.jpeg",
      "assets/image2.jpeg",
      "assets/image3.jpeg",
      "assets/image4.jpeg"
    ];
    final places = ["Tikal", "Atitlán", "Semuc", "Xela"];
    final desc = [
      "Civilización maya, en su máxima expresión",
      "El lago más hermoso del mundo",
      "Un paraíso natural en medio del bosque",
      "La cuna de la cultura y de los mejores ingenieros"
    ];

    final urlImages2 = [
      "assets/image5.jpeg",
      "assets/image6.jpeg",
      "assets/image7.jpeg",
      "assets/image8.jpeg"
    ];
    final palabras1 = ["Volcan", "Cultura en el", "Camping", "Senderos en"];
    final palabras2 = ["Tajumulco", "altiplano", "Tecpán", "Todos Santos"];
    final tiempos = ["2 días", "3 días", "2 días", "1 día"];
    final costos = ["Q. 325", "Q. 570", "Q. 430", "Q. 270"];
    return PixelPerfect(
      assetPath: 'assets/Captura.JPG',
      scale: 380 / MediaQuery.of(context).size.width,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              NameBar(),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: urlImages.length,
                  itemBuilder: (context, index) {
                    final urlImage = urlImages[index];
                    final place = places[index];
                    final describe = desc[index];
                    return buildImage(urlImage, place, describe, index);
                  },
                ),
              ),
              Activities(),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: urlImages.length,
                  itemBuilder: (context, index) {
                    final urlImage = urlImages2[index];
                    final palabra1 = palabras1[index];
                    final palabra2 = palabras2[index];
                    final costo = costos[index];
                    final tiempo = tiempos[index];
                    return buildImage2(
                        urlImage, palabra1, palabra2, tiempo, costo, index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Activities extends StatelessWidget {
  const Activities({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 200.0, top: 5),
      child: Text('Actividades', style: Theme.of(context).textTheme.subtitle1),
    );
  }
}

class NameBar extends StatelessWidget {
  const NameBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 22.0, right: 150),
          child: Container(
              child: Text('Guatemala',
                  style: Theme.of(context).textTheme.headline1)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2.0, right: 150),
          child: Container(
              child: Text('Corazon del mundo maya',
                  style: Theme.of(context).textTheme.headline2)),
        ),
      ],
    );
  }
}

Widget buildImage(String assetName, String lugar, String describe, int index) =>
    Container(
      height: 190,
      margin: EdgeInsets.only(right: 10.0, left: 10.0, top: 20),
      width: 180,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(assetName),
          fit: BoxFit.cover,
        ),
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 175.0, right: 65),
            child: Container(
                child: Text(lugar,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 0.25))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0, left: 15),
            child: Container(
                child: Text(describe,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 0.1))),
          ),
        ],
      ),
    );

Widget buildImage2(String assetName, String palabra1, String palabra2,
        String tiempo, String costo, int index) =>
    Container(
      margin: EdgeInsets.only(
        top: 10.0,
        left: 5.0,
        right: 5.0,
      ),
      width: 300,
      height: 90,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(assetName),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 10),
            child: Column(
              children: [
                Text(palabra1,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 0.25)),
                Text(palabra2,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 0.25))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 145),
            child: Column(
              children: [
                Text(tiempo,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 0.25)),
                SizedBox(
                  height: 15,
                ),
                Text(costo,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 0.25))
              ],
            ),
          ),
        ],
      ),
    );
