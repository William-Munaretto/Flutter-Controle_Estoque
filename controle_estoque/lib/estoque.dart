import 'package:controle_estoque/database/databaseHelper.dart';
import 'package:controle_estoque/models/cerveja.dart';
import 'package:flutter/material.dart';

class Estoque extends StatefulWidget {
  const Estoque({super.key});

  @override
  State<Estoque> createState() => _EstoqueState();
}

class _EstoqueState extends State<Estoque> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0C322C),
        title: const Text(
          'Estoque',
        ),
      ),
      body: Center(
        child: FutureBuilder<List<Cerveja>>(
            future: DatabaseHelper.instance.listarCervejas(),
            builder: (context, snapshot) {
              return snapshot.data!.isEmpty
                  ? const Center(
                      child: Text(
                        "Estoque vazio",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    )
                  : ListView(
                      children: snapshot.data!.map((cerveja) {
                        return Center();
                      }).toList(),
                    );
            }),
      ),
    );
  }
}
