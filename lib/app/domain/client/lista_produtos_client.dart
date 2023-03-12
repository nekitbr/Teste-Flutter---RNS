import 'package:teste_salcisne/app/domain/entity/produto_entity.dart';

abstract class ProdutosClient {
  Future<List<Produto>> getListaProdutos();
}
