part of 'lista_estoques_bloc.dart';

@immutable
abstract class ListaEstoquesState {}

class ListaEstoquesInitial extends ListaEstoquesState {}

class Loading extends ListaEstoquesState {}

class ListaCarregada extends ListaEstoquesState {
  final List<Estoque> produtos;

  ListaCarregada(this.produtos);
}

class Error extends ListaEstoquesState {
  final String message;

  Error(this.message);
}
