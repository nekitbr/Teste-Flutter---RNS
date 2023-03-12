import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_salcisne/app/presentation/ui/home/home_widget.dart';

import '../../bloc/produtos/lista_produtos_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ListaProdutosBloc(),
      child: HomeWidget(),
    );
  }
}
