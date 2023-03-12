import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teste_salcisne/app/data/lista_estoques_client_impl.dart';
import 'package:teste_salcisne/app/domain/client/lista_estoques_client.dart';
import 'package:teste_salcisne/app/domain/entity/estoque_entity.dart';

part 'lista_estoques_event.dart';
part 'lista_estoques_state.dart';

class ListaEstoquesBloc extends Bloc<ListaEstoquesEvent, ListaEstoquesState> {
  final EstoquesClient client = EstoquesClientImpl();

  @override
  ListaEstoquesState get initialState => ListaEstoquesInitial();

  @override
  Stream<ListaEstoquesState> mapEventToState(
    ListaEstoquesEvent event,
  ) async* {
    if (event is GetListaEstoques) {
      yield Loading();

      try {
        final _lista = await client.getListaEstoques();
        yield ListaCarregada(_lista);
      } catch (e) {
        yield Error(e.toString());
      }
    }
  }
}
