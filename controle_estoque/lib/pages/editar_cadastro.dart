import 'package:controle_estoque/database/databaseHelper.dart';
import 'package:controle_estoque/pages/estoque.dart';
import 'package:controle_estoque/models/cerveja.dart';
import 'package:flutter/material.dart';

class EditarCadastro extends StatefulWidget {
  EditarCadastro({
    super.key,
    required this.cerveja,
  });

  Cerveja cerveja;

  @override
  State<EditarCadastro> createState() => _CadastroState();
}

class _CadastroState extends State<EditarCadastro> {
  final _formKey = GlobalKey<FormState>();
  final _controllerNome = TextEditingController();
  final _controllerTipo = TextEditingController();
  final _controllerIbu = TextEditingController();
  final _controllerDescricao = TextEditingController();

  @override
  void initState() {
    _exibirParaEdicao();
    super.initState();
  }

  _exibirParaEdicao() {
    if (widget.cerveja.id != null) {
      setState(() {
        _controllerNome.text = widget.cerveja.nome.toString();
        _controllerTipo.text = widget.cerveja.tipo.toString();
        _controllerIbu.text = widget.cerveja.ibu.toString();
        _controllerDescricao.text = widget.cerveja.descricao.toString();
      });
    }
  }

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
                key: _formKey,
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
                            labelText: 'Nome da Cerveja'),
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
                          if (widget.cerveja.id != null) {
                            widget.cerveja.nome = _controllerNome.text;
                            widget.cerveja.tipo = _controllerTipo.text;
                            widget.cerveja.ibu =
                                int.tryParse(_controllerIbu.text)!;
                            widget.cerveja.descricao =
                                _controllerDescricao.text;
                            DatabaseHelper.instance
                                .updateCerveja(widget.cerveja);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const Estoque()));
                          }
                        },
                        child: const Text('Atualizar'),
                      )
                    ],
                  ),
                )),
          ),
        ));
  }
}
