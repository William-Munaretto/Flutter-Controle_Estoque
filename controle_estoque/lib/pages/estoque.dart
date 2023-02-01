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
                        return Center(
                          child: Column(
                            children: [
                              ListTile(
                                contentPadding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 5),
                                leading: Image.asset(
                                  "assets/images/lupulo.jpg",
                                  height: 60,
                                ),
                                title: Text(
                                  cerveja.nome!,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      const TextSpan(
                                        text: 'Tipo: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: cerveja.tipo,
                                      ),
                                      const TextSpan(
                                        text: 'IBU: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: cerveja.ibu.toString(),
                                      ),
                                      const TextSpan(
                                        text: 'Descricao: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: cerveja.descricao,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    );
            }),
      ),
    );
  }
}
