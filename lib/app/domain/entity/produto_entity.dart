import 'package:teste_salcisne/app/domain/entity/estoque_entity.dart';

class Produto {
  String id;
  String nome;
  String local;
  int quantidade;

  Produto({
    this.id,
    this.nome,
    this.local,
    this.quantidade,
  });

  factory Produto.fromEstoque(Estoque estoque) => Produto(
    id: estoque.produto.id,
    nome: estoque.produto.nome,
    local: estoque.filial.razaoSocial,
    quantidade: estoque.quantidade
  );

  factory Produto.fromJson(Map<String, dynamic> json) => Produto(
    nome: json["nome"],
    local: json["local"],
    quantidade: json["quantidade"],
  );

  Map<String, dynamic> toJson() => {
    "nome": nome,
    "local": local,
    "quantidade": quantidade,
  };
}
