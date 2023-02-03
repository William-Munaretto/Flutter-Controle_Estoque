import 'package:controle_estoque/pages/cadastro_estoque.dart';
import 'package:controle_estoque/pages/estoque.dart';
import 'package:controle_estoque/models/cerveja.dart';

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
      appBar: AppBar(
        backgroundColor: const Color(0xff0C322C),
        title: const Text('Beer Stock'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/lupulo.jpg"),
            fit: BoxFit.cover,
          ),
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
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff0C322C),
                    )),
                onPressed: () => _cadastroCerveja(),
                child: const Text('Cadastro'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xffFE7C3F),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    textStyle: const TextStyle(
                      fontSize: 20,
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

  _cadastroCerveja() {
    Cerveja cerveja;
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => Cadastro()));
  }

  _listarCervejas() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => const Estoque()));
  }
}
