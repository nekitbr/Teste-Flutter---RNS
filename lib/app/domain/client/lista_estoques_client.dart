import 'package:teste_salcisne/app/domain/entity/estoque_entity.dart';

abstract class EstoquesClient {
  Future<List<Estoque>> getListaEstoques();
}
