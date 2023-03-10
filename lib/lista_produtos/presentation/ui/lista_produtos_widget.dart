import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/lista_produtos_bloc.dart';

class ListaProdutosWidget extends StatelessWidget {
  const ListaProdutosWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de produtos')),
      body: Center(
        child: BlocBuilder<ListaProdutosBloc, ListaProdutosState>(
          builder: (context, state) {
            if (state is ListaProdutosInitial) {
            } else if (state is Error) {
            } else if (state is Loading) {
            } else if (state is ListaCarregada) {}

            return Container(
                child:
                    Text("TODO: implementar a tela de listagem de produtos"));
          },
        ),
      ),
    );
  }
}
