import 'package:controle_estoque/pages/cadastro_estoque.dart';
import 'package:controle_estoque/database/databaseHelper.dart';
import 'package:controle_estoque/models/cerveja.dart';
import 'package:controle_estoque/pages/editar_cadastro.dart';
import 'package:flutter/material.dart';

class Estoque extends StatefulWidget {
  const Estoque({super.key});

  @override
  State<Estoque> createState() => _EstoqueState();
}

class _EstoqueState extends State<Estoque> {
  List<Cerveja> _cervejas = [];

  _atualizarListaCervejas() async {
    List<Cerveja> listaCervejas =
        await DatabaseHelper.instance.listarCervejas();
    setState(() {
      _cervejas = listaCervejas;
    });
  }

  @override
  void initState() {
    super.initState();
    _atualizarListaCervejas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff0C322C),
          title: const Text(
            'Estoque',
          ),
        ),
        body: _cervejas.isNotEmpty
            ? Container(
                color: const Color(0xffC1E7DA),
                child: ListView.builder(
                  itemCount: _cervejas.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Container(
                        color: Colors.white,
                        child: ListTile(
                          leading: Image.asset('assets/images/lupulo.jpg'),
                          title: Text(
                            _cervejas[index].nome,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: "Tipo: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: _cervejas[index].nome,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                const TextSpan(
                                  text: "\nIBU: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: _cervejas[index].ibu.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                const TextSpan(
                                  text: "\nDescricao: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                WidgetSpan(
                                  child: Text(
                                    _cervejas[index].descricao,
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          trailing: Container(
                            width: 100,
                            child: Row(
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            EditarCadastro(
                                                cerveja: _cervejas[index]),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.amber,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        elevation: 5.0,
                                        title: Text(
                                            "Deseja excluir ${_cervejas[index].nome} definitivamente?"),
                                        actions: [
                                          MaterialButton(
                                            child: const Text("Sim"),
                                            onPressed: () {
                                              setState(() {
                                                DatabaseHelper.instance
                                                    .deleteCerveja(
                                                        _cervejas[index].id!);
                                                _atualizarListaCervejas();
                                              });
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                content: Text(
                                                    "Cerveja excluída com sucesso!",
                                                    textAlign:
                                                        TextAlign.justify),
                                                duration: Duration(seconds: 2),
                                                backgroundColor:
                                                    Color(0xffFE7C3F),
                                              ));

                                              Navigator.pop(context);
                                            },
                                          ),
                                          MaterialButton(
                                            child: const Text('Não'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              )
            : Container(
                color: const Color(0xffC1E7DA),
                child: const Center(
                  child: Text(
                    "Estoque vazio",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ));
  }
}
