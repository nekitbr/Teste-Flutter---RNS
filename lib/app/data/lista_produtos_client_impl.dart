import 'dart:convert';
import 'dart:io';

import 'package:teste_salcisne/app/domain/entity/produto_entity.dart';
import 'package:http/http.dart' as http;

import '../domain/client/lista_produtos_client.dart';

class ProdutosClientImpl implements ProdutosClient {
  final String url = 'http://192.168.0.185:8080/produtos?extra-info=true';
  var client = http.Client();

  @override
  Future<List<Produto>> getListaProdutos() async {
    try {
      var _response = await client.get(url);

      if (_response.statusCode == HttpStatus.ok) {
        final _json = json.decode(_response.body);
        return _json
            .map<Produto>((_produtoJson) => Produto.fromJson(_produtoJson))
            .toList(growable: true);
      } else {
        throw http.ClientException("Houve um erro na requisição");
      }
    } catch (e) {
      throw http.ClientException("Erro inesperado ao carregar produtos");
    }
  }
}