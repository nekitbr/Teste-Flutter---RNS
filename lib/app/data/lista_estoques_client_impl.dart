import 'dart:convert';
import 'dart:io';

import 'package:teste_salcisne/app/domain/entity/estoque_entity.dart';
import 'package:http/http.dart' as http;

import '../domain/client/lista_estoques_client.dart';

class EstoquesClientImpl implements EstoquesClient {
  final String url = 'http://localhost:8080/estoques';
  var client = http.Client();

  @override
  Future<List<Estoque>> getListaEstoques() async {
    try {
      var _response = await client.get(url);

      if (_response.statusCode == HttpStatus.ok) {
        final estoqueJson = json.decode(_response.body);
        return estoqueJson
            .map<Estoque>((_produtoJson) => Estoque.fromJson(_produtoJson))
            .toList(growable: true);
      } else {
        throw http.ClientException("Houve um erro na requisição");
      }
    } catch (e) {
      throw http.ClientException("Erro inesperado ao carregar estoques");
    }
  }
}
