class Cerveja {
  int? id;
  String? nome;
  String? tipo;
  int? ibu;
  String? descricao;

  Cerveja({
    this.id,
    this.nome,
    this.tipo,
    this.ibu,
    this.descricao,
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
