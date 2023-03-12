import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_salcisne/app/presentation/bloc/estoques/lista_estoques_bloc.dart';
import 'package:teste_salcisne/app/presentation/ui/estoques/lista_estoques_widget.dart';

class ListaEstoquesPage extends StatelessWidget {
  const ListaEstoquesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ListaEstoquesBloc(),
      child: ListaEstoquesWidget(),
    );
  }
}
