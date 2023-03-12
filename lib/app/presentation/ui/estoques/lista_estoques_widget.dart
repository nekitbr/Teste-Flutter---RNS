import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_salcisne/app/presentation/bloc/estoques/lista_estoques_bloc.dart';

class ListaEstoquesWidget extends StatelessWidget {
  const ListaEstoquesWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ListaEstoquesBloc, ListaEstoquesState>(
        builder: (context, state) {
          if (state is ListaEstoquesInitial) {
            BlocProvider.of<ListaEstoquesBloc>(context).add(GetListaEstoques()); // fetches product list
          } else if (state is Error) {
            return Text('Erro: ${state.message}');
          } else if (state is Loading) {
            return const CircularProgressIndicator();
          } else if (state is ListaCarregada) {
            final estoques = state.produtos;

            if(estoques.isEmpty) {
              return Text("Sem produtos em estoque.");
            }

            return ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: estoques.length,
              itemBuilder: (context, index) {
                final estoque = estoques[index];

                return InkWell(
                  onTap: () => print('estoque inkwell'),
                  child: Ink(
                    color: index % 2 == 0 ? Colors.grey[200] : Colors.white,
                    child: ListTile(
                      title: Text(estoque.produto.nome),
                      subtitle: Text('${estoque.quantidade} un. - ${estoque.filial.endereco}'),
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
