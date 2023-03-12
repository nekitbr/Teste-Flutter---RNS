import 'package:teste_salcisne/app/domain/entity/filial_entity.dart';
import 'package:teste_salcisne/app/domain/entity/produto_entity.dart';

class Estoque {
  int id;
  Produto produto;
  Filial filial;
  int quantidade;

  Estoque({
    this.id,
    this.produto,
    this.filial,
    this.quantidade,
  });

  factory Estoque.fromJson(Map<String, dynamic> json) {
    final quantidade = json["quantidade"];
    final filial = Filial.fromJson(json["filial"]);

    final produtoJson = json["produto"];
    final produto = Produto(
      id: produtoJson["id"],
      nome: produtoJson["nome"],
      quantidade: quantidade,
      local: filial.razaoSocial,
    );

    return Estoque(
      id: json["id"],
      filial: filial,
      produto: produto,
      quantidade: quantidade,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "filial": filial,
    "produto": produto,
    "quantidade": quantidade,
  };
}
