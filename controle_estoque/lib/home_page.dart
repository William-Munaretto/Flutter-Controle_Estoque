import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xffFE7C3F), actions: [
        Stack(children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Color(0xff0C322C),
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: CircleAvatar(
              maxRadius: 10,
              backgroundColor: Colors.red.shade800,
              child: Text(
                '$count',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ]),
      ]),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/lupulo.png')),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color(0xffFE7C3F),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    textStyle: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff0C322C),
                    )),
                onPressed: () => _cadastroCerveja(),
                child: const Text('Cadastro'),
              ),
              const SizedBox(
                width: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color(0xffFE7C3F),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    textStyle: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff0C322C),
                    )),
                onPressed: () => _listarCervejas(),
                child: const Text('Lista de Cervejas'),
              )
            ],
          ),
        ),
      ),
    );
  }

  _cadastroCerveja() {}

  _listarCervejas() {}
}
