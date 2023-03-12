import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/produtos/lista_produtos_bloc.dart';

class ListaProdutosWidget extends StatelessWidget {
  const ListaProdutosWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ListaProdutosBloc, ListaProdutosState>(
        builder: (context, state) {
          if (state is ListaProdutosInitial) {
            BlocProvider.of<ListaProdutosBloc>(context).add(GetListaProdutos()); // fetches product list
          } else if (state is Error) {
            return Text('Erro: ${state.message}');
          } else if (state is Loading) {
            return const CircularProgressIndicator();
          } else if (state is ListaCarregada) {
            final produtos = state.produtos;

            if(produtos.isEmpty) {
              return Text("Sem produtos cadastrados.");
            }

            return ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: produtos.length,
              itemBuilder: (context, index) {
                final produto = produtos[index];

                return InkWell(
                  onTap:() => print('produtos inkwell'),
                  child: Ink(
                    color: index % 2 == 0 ? Colors.grey[200] : Colors.white,
                    child: ListTile(
                      title: Text(produto.nome)
                    )
                  )
                );
              },
            );
          }

          return Container(
            child: Text("Erro inesperado.")
          );
        },
      ),
    );
  }
}
