class Cerveja {
  int? id;
  String nome;
  String tipo;
  int ibu;
  String descricao;

  Cerveja({
    this.id,
    required this.nome,
    required this.tipo,
    required this.ibu,
    required this.descricao,
  });

  factory Cerveja.fromMap(Map<String, dynamic> json) => Cerveja(
        id: json['id'],
        nome: json['nome'],
        tipo: json['tipo'],
        ibu: json['ibu'],
        descricao: json['descricao'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'tipo': tipo,
      'ibu': ibu,
      'descricao': descricao,
    };
  }
}
