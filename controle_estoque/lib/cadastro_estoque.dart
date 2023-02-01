import 'package:controle_estoque/database/databaseHelper.dart';
import 'package:controle_estoque/estoque.dart';
import 'package:controle_estoque/models/cerveja.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();
  final _controllerNome = TextEditingController();
  final _controllerTipo = TextEditingController();
  final _controllerIbu = TextEditingController();
  final _controllerDescricao = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff0C322C),
          title: const Text(
            'Cadastro',
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Form(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _controllerNome,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xff0C322C)),
                          borderRadius: BorderRadius.circular(60),
                        ),
                        labelText: 'Nome da Ceveja'),
                    // validator:,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _controllerTipo,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xff0C322C)),
                          borderRadius: BorderRadius.circular(60),
                        ),
                        labelText: 'Tipo da Cerveja'),
                    // validator: isNotEmpty,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _controllerIbu,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xff0C322C)),
                          borderRadius: BorderRadius.circular(60),
                        ),
                        labelText: 'IBU - amargor'),
                    // validator: isNotEmpty,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    maxLines: null,
                    controller: _controllerDescricao,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xff0C322C)),
                          borderRadius: BorderRadius.circular(60),
                        ),
                        labelText: 'Descrição'),
                    // validator: isNotEmpty,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xffFE7C3F),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 10),
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff0C322C),
                        )),
                    onPressed: () async {
                      final cerveja = Cerveja(
                        nome: _controllerNome.text,
                        tipo: _controllerTipo.text,
                        ibu: int.tryParse(_controllerIbu.text),
                        descricao: _controllerDescricao.text,
                      );
                      DatabaseHelper.instance.addCerveja(cerveja);

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const Estoque()));
                    },
                    child: const Text('Salvar'),
                  )
                ],
              ),
            )),
          ),
        ));
  }
}
